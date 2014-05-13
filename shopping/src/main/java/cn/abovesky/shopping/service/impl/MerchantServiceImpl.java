package cn.abovesky.shopping.service.impl;

import cn.abovesky.shopping.base.BaseConditionVO;
import cn.abovesky.shopping.common.enums.MerchantStatus;
import cn.abovesky.shopping.dao.MerchantMapper;
import cn.abovesky.shopping.domain.Merchant;
import cn.abovesky.shopping.exception.ServiceException;
import cn.abovesky.shopping.service.IMerchantService;
import cn.abovesky.shopping.util.CompressImage;
import cn.abovesky.shopping.util.IdStatusSplitUtils;
import cn.abovesky.shopping.util.PathUtils;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Created by snow on 2014/4/20.
 */
@Transactional(rollbackFor = Exception.class)
@Service(IMerchantService.SERVICE_NAME)
public class MerchantServiceImpl implements IMerchantService {
    @Autowired
    private MerchantMapper merchantMapper;

    @Override
    public boolean isUniqueUsername(String username) {
        return merchantMapper.isUniqueUsername(username) < 1;
    }

    @Override
    public void insertMerchant(Merchant merchant) throws ServiceException {
        if (!isUniqueUsername(merchant.getUsername()))
            throw new ServiceException("用户名已存在");
        Date now = new Date();
        merchant.setPassword(DigestUtils.md5DigestAsHex(merchant.getPassword().getBytes()));
        merchant.setInsertDate(now);
        merchant.setUpdateDate(now);
        merchant.setStatus(MerchantStatus.ACTIVE.toString());
        merchant.setSaleCount(0);
        merchant.setCollectionCount(0);
        merchantMapper.insert(merchant);
    }

    @Override
    public void update(MultipartFile image, Merchant merchant, String path) throws ServiceException {
        if (!image.isEmpty()) {
            if (!StringUtils.isEmpty(merchant.getImage())) {
                File originalImage = new File(path + merchant.getImage());
                if (originalImage.exists()) {
                    originalImage.delete();
                }
            }
            String newImageFileName = UUID.randomUUID().toString() + PathUtils.fileSuffix(image.getOriginalFilename());
            try {
                new CompressImage().compressPic(image.getInputStream(), path + newImageFileName, 300, 300, true);
            } catch (IOException e) {
                throw new ServiceException(e.getMessage());
            }
            merchant.setImage(newImageFileName);
        }
        merchant.setUpdateDate(new Date());
        merchantMapper.updateByPrimaryKeySelective(merchant);
    }

    @Override
    public Merchant findByUsername(String username) {
        return merchantMapper.findByUsername(username);
    }

    @Override
    public List<Merchant> findPageBreakByCondition(BaseConditionVO vo) {
        RowBounds rb = new RowBounds(vo.getStartIndex(), vo.getPageSize());
        List<Merchant> merchantList = merchantMapper.findPageBreakByCondition(vo, rb);
        vo.setTotalCount(merchantList.size());
        return merchantList;
    }

    @Override
    public Integer getCollectionCountById(Integer id) {
        return merchantMapper.getCollectionCountById(id);
    }

    @Override
    public void changePwd(Integer id, String oldPassword, String newPassword) throws ServiceException {
        Merchant merchant = merchantMapper.selectByPrimaryKey(id);
        if (merchant != null && merchant.getPassword().equals(DigestUtils.md5DigestAsHex(oldPassword.getBytes()))) {
            merchant.setPassword(DigestUtils.md5DigestAsHex(newPassword.getBytes()));
            merchantMapper.updateByPrimaryKeySelective(merchant);
        } else {
            throw new ServiceException("原密码错误");
        }
    }

    @Override
    public Merchant findById(Integer id) {
        Merchant merchant = merchantMapper.selectByPrimaryKey(id);
        merchant.setPassword(null);
        return merchant;
    }

    @Override
    public String getImageById(Integer id) {
        return merchantMapper.getImageById(id);
    }

    @Override
    public List<Merchant> findAll() {
        return merchantMapper.findAll();
    }

    @Override
    public void active(String[] ids) throws ServiceException {
        if (IdStatusSplitUtils.isFormatSecret(ids, MerchantStatus.PENDING.toString(), MerchantStatus.INACTIVE.toString())) {
            merchantMapper.active(IdStatusSplitUtils.split2Id(ids));
        } else {
            throw new ServiceException("只能操作审核中和被禁用的商家");
        }
    }

    @Override
    public void inactive(String[] ids) throws ServiceException {
        if (IdStatusSplitUtils.isFormatSecret(ids, MerchantStatus.PENDING.toString(), MerchantStatus.ACTIVE.toString())) {
            merchantMapper.inactive(IdStatusSplitUtils.split2Id(ids));
        } else {
            throw new ServiceException("只能操作审核中和正常使用的商家");
        }
    }
}

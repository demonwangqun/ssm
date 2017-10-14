package org.seckill.service;

import java.util.List;

import org.seckill.dto.Exposer;
import org.seckill.dto.SeckillExecution;
import org.seckill.entity.Seckill;
import org.seckill.exception.RepeatKillException;
import org.seckill.exception.SeckillCloseException;
import org.seckill.exception.SeckillException;

/**
 * @author home
 * 
 *         业务接口：站在使用者的角度设计接口 三个方面1定义方法的粒度方法定义要非常清楚 参数越简洁越好 返回类型,return 允许的异常
 * 
 */
public interface SeckillService {

	/**
	 * 查询全部的秒杀记录
	 */
	List<Seckill> getSeckillList();

	/**
	 * 查询单个的秒杀记录
	 * 
	 * @param seckillId
	 * @return
	 */
	Seckill getById(long seckillId);

	/**
	 * 秒杀开启输出秒杀接口地址 否则输出系统时间和秒杀时间
	 * 
	 * @param seckillId
	 */
	Exposer exportSeckillUrl(long seckillId);

	/**
	 * 执行秒杀操作
	 * 
	 * @param seckillId
	 * @param userPhone
	 * @param md5
	 */
	SeckillExecution executeSeckill(long seckillId, long userPhone, String md5)
			throws SeckillException, RepeatKillException, SeckillCloseException;

	/**
	 * 执行秒杀操作by 存储过程
	 * 
	 * @param seckillId
	 * @param userPhone
	 * @param md5
	 */
	SeckillExecution executeSeckillProcedure(long seckillId, long userPhone,
			String md5) throws SeckillException, RepeatKillException,
			SeckillCloseException;
}

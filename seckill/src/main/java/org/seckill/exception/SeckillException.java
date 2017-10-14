package org.seckill.exception;

/**
 * 秒杀相关的所有异常
 * 
 * @author home
 * 
 */
public class SeckillException extends RuntimeException {

	public SeckillException(String message) {

		super(message);
	}

	public SeckillException(String message, Throwable cause) {

		super(message, cause);
	}

}

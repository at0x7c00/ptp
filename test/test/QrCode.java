package test;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Hashtable;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

public class QrCode {

	public static void main(String[] args) throws IOException {
		
		FileInputStream fs = new FileInputStream("D:\\qr-base.png");
		BufferedImage baseImage = ImageIO.read(fs);
		fs.close();
		
		BufferedImage image = new QrCode().createQRCodeBitmap("http://www.baidu.com",baseImage);
		File outputfile = new File("D:\\image.png");
		ImageIO.write(image, "png", outputfile);
	}
	
	// 生成QR图
	private BufferedImage createQRCodeBitmap(String text,BufferedImage base) {
	    int QR_WIDTH = 325, QR_HEIGHT = 325;
	    try {
	        // 需要引入core包
	        QRCodeWriter writer = new QRCodeWriter();
	        
	        //Log.i(TAG, "生成的文本：" + text);
	        if (text == null || "".equals(text) || text.length() < 1) {
	            return null;
	        }
	 
	        Hashtable<EncodeHintType, Comparable> hints = new Hashtable<EncodeHintType, Comparable>();
	        hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
	        hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
	        hints.put(EncodeHintType.MARGIN,0);
	        //比特矩阵
	        BitMatrix bitMatrix = writer.encode(text,
	                BarcodeFormat.QR_CODE, QR_WIDTH, QR_HEIGHT, hints);
	        int[] pixels = new int[QR_WIDTH * QR_HEIGHT];
	        //比特矩阵转颜色数组
	        //BufferedImage image = new BufferedImage(QR_WIDTH, QR_HEIGHT, BufferedImage.TYPE_4BYTE_ABGR);
	        if(base==null){
	        	base = new BufferedImage(QR_WIDTH, QR_HEIGHT, BufferedImage.TYPE_4BYTE_ABGR);
	        }
	        int black = new Color(0,0,0).getRGB();
	        int white = new Color(255,255,255).getRGB();
	        int offset = 40;
	        for (int y = 0; y < QR_HEIGHT; y++) {
	            for (int x = 0; x < QR_WIDTH; x++) {
	                if (bitMatrix.get(x, y)) {
	                    pixels[y * QR_WIDTH + x] = 0xff000000;//黑点
	                    base.setRGB(x + 40, y + 40, black);
	                } else {
	                    pixels[y * QR_WIDTH + x] = 0x00ffffff;//透明点,白点为0xffffffff
	                    //base.setRGB(x + 40, y + 40, white);
	                }
	 
	            }
	        }
	         
	        //解析颜色数组,其他的java平台可以选择其他的API
	        
	        //image.setRGB(5, 20, Color.BLUE.getRGB());
	        
	        
	       // image.setRGB(0,      0,      QR_WIDTH, QR_WIDTH, pixels,   QR_WIDTH, QR_WIDTH);
	        
	        //image.setRGB(startX, startY, w,        h,        rgbArray, offset,   scansize);
	        
	        //Bitmap bitmap = Bitmap.createBitmap(QR_WIDTH, QR_HEIGHT,  Bitmap.Config.ARGB_8888);
	 
	        //bitmap.setPixels(pixels, 0, QR_WIDTH, 0, 0, QR_WIDTH, QR_HEIGHT);
	        //return bitmap;
	        return base;
	 
	    } catch (WriterException e) {
	        e.printStackTrace();
	        return null;
	    }
	}
}

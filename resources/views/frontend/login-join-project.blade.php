<form method="post" name="frm" class="margin-top-15 box-article">
    {{ csrf_field() }}    
    <h2 class="tieu-de-bai-viet">
        Đăng nhập
    </h2>
    <?php                           
    if(count($error) > 0 || count($success) > 0){
        ?>
        <div class="alert-system margin-top-15">
            <?php                                           
            if(count($error) > 0){
                ?>
                <ul class="alert-error">
                    <?php 
                    foreach ($error as $key => $value) {
                        ?>
                        <li><?php echo $value; ?></li>
                        <?php
                    }
                    ?>                              
                </ul>
                <?php
            }
            if(count($success) > 0){
                ?>
                <ul class="alert-success">
                    <?php 
                    foreach ($success as $key => $value) {
                        ?>
                        <li><?php echo $value; ?></li>
                        <?php
                    }
                    ?>                              
                </ul>
                <?php
            }
            ?>                                              
        </div>              
        <?php
    }
    ?>
    <table class="com_product30 margin-top-15" border="0" width="40%" cellpadding="0" cellspacing="0">                   
        <tbody>        
            <tr>
                <td align="right">Tài khoản</td>
                <td><input type="text" name="username" /></td>        
            </tr>       
            <tr>
                <td align="right">Mật khẩu</td>
                <td><input type="password" name="password" /></td>        
            </tr>            
            <tr>           
                <td></td>
                <td class="com_product31" align="right">
                    <div class="box-readmore">
                        <a href="javascript:void(0);" onclick="document.forms['frm'].submit();">Đăng nhập</a>
                        <a href="<?php echo route('frontend.index.register'); ?>" >Đăng ký</a>       
                    </div>  
                </td>                      
            </tr> 
        </tbody>    
    </table>
</form>

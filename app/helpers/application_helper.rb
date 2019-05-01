module ApplicationHelper
    def hide_cart_if(condition, attributes = {}, &block)
    if condition
        attributes["style"] = "display:none"
    end 
    content_tag("div", attributes, &block)    
    end
end
#condition được truyền vào ở đây cho biết giỏ hàng có trống không
#Tham số attributes là một danh sách các tham số khác, ở trên chúng ta truyền vào là id có giá trị "cart".
#Tham số &block là đoạn <%= render current_cart %>.
# content_tag(), hàm này nhận vào tên một thẻ, danh sách các thuộc tính và giá trị của tham số đó, và biến &block, hàm này sẽ bọc những gì trong &block với tên thẻ và thuộc tính. 
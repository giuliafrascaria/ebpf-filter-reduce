#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>

MODULE_LICENSE("GPL");
MODULE_AUTHOR("Giogge");
MODULE_DESCRIPTION("I just need to check string to long conversion");
MODULE_VERSION("0.01");

static int __init lkm_example_init(void) 
{
    
    char *buf;
    long value;

    printk(KERN_INFO "Yo!\n");
    buf = "42";
    if(kstrtol(buf, 10, &value) != 0)
         return -1;
    printk(KERN_INFO "the answer to life, the universe and everything is %ld\n", value);
    return 0;
}


static void __exit lkm_example_exit(void) 
{
    printk(KERN_INFO "So long and thanks for all the fish\n");
}


module_init(lkm_example_init);
module_exit(lkm_example_exit);
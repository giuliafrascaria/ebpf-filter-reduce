#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/init.h>
#include <linux/kernel.h>   
#include <linux/proc_fs.h>
#include <asm/uaccess.h>
#include <linux/uaccess.h>
#include <linux/slab.h>


#define BUFSIZE  4096
#define COPYSIZE 1024
#define procfs_name "helloworld"
 
 
static int irq=20;
module_param(irq,int,0660);
 
static int mode=1;
module_param(mode,int,0660);
 
static struct proc_dir_entry *ent;
 
static ssize_t mywrite(struct file *file, const char __user *ubuf, size_t count, loff_t *ppos) 
{
	printk( KERN_DEBUG "write handler\n");
	return -1;
}
 
static ssize_t myread(struct file *file, char __user *ubuf,size_t count, loff_t *ppos) 
{
	//char buf[BUFSIZE];
	char *buf = kmalloc(BUFSIZE, GFP_KERNEL);
	int len=0;
	if(*ppos > 0 || count < BUFSIZE)
		return 0;
	//len += sprintf(buf,"irq = %d\n",irq);
	//len += sprintf(buf + len,"mode = %d\n",mode);

	len += sprintf(buf,"%0*d", BUFSIZE - 2, 0);
	len += sprintf(buf + len, "\n");
	
	if(copy_to_user(ubuf,buf,len))
		return -EFAULT;

	kfree(buf);

	*ppos = len;
	return len;
}
ALLOW_ERROR_INJECTION(myread, ERRNO);
EXPORT_SYMBOL(myread);

 
static struct file_operations myops = 
{
	.owner = THIS_MODULE,
	.read = myread,
	.write = mywrite,
};
 
static int simple_init(void)
{
	ent=proc_create(procfs_name, 0, NULL, &myops);

	if (ent == NULL)
	{
		proc_remove(ent);
		printk(KERN_ALERT "Error: Could not initialize /proc/%s\n",
		       procfs_name);
		return -ENOMEM;
	}
	printk(KERN_ALERT "hello world created\n");
	return 0;
}
 
static void simple_cleanup(void)
{
	proc_remove(ent);
	printk(KERN_WARNING "so long and thanks for all the fish\n");
}
 
module_init(simple_init);
module_exit(simple_cleanup);
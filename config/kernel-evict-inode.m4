dnl #
dnl # 2.6.36 API change
dnl # The sops->delete_inode() and sops->clear_inode() callbacks have
dnl # replaced by a single sops->evict_inode() callback.
dnl #
AC_DEFUN([ZFS_AC_KERNEL_EVICT_INODE], [
	AC_MSG_CHECKING([whether sops->evict_inode() exists])
	ZFS_LINUX_TRY_COMPILE([
		#include <linux/fs.h>
	],[
		void (*evict_inode) (struct inode *) = NULL;
		struct super_operations sops;

		sops.evict_inode = evict_inode;
	],[
		AC_MSG_RESULT(yes)
		AC_DEFINE(HAVE_EVICT_INODE, 1, [sops->evict_inode() exists])
	],[
		AC_MSG_RESULT(no)
	])
])

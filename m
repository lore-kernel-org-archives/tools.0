Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 555F620FAAC
	for <tools@linux.kernel.org>; Thu, 23 Jan 2025 13:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737638955; cv=none; b=rfp91V5beQ8AAWAyhfyhS9nadetrXvkNg45ZaBlF4wsgYV4/bu6bEV92F+qcQg8HpFR6H04+TG8vJWPjFQEppILLZh9AdpwyO55QkTW3TfrWZ2dyNA+oQcXDgWxutEB7It6nVtZtaO0JcFUOBjXR6sJ3ynCRYm3KbUsSaTYhKhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737638955; c=relaxed/simple;
	bh=pqx9CaPs+dpWwMa6NBowt+ioKCEWpsHa6uSnXFKgVLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC:
	 References; b=ftfnuTHJDB7JwzqPRqmCqYJ3r+WotThz7AmFCt5fiJznOMfozXY2zLEePZD/mCqc1grRloeY0I9nqtJrye4itF3H++WBcbiDdKRk+vctBJaDbt2a+2HQWD/UvbAMXkFg2QMooXhylNV0XZJmavMoYI5jDo8VjqgTaRft4XgcxxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=jx/8JVcz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="jx/8JVcz"
Received: by smtp.kernel.org (Postfix)
	id D0AF7C4CEDD; Thu, 23 Jan 2025 13:29:13 +0000 (UTC)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DB76C4CEE1
	for <tools@kernel.org>; Thu, 23 Jan 2025 13:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9DB76C4CEE1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250123132903euoutp02e7abc1fe71ff23c286378c8a94fe5f18~dVWmi8LpQ1611816118euoutp02G
	for <tools@kernel.org>; Thu, 23 Jan 2025 13:29:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250123132903euoutp02e7abc1fe71ff23c286378c8a94fe5f18~dVWmi8LpQ1611816118euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1737638943;
	bh=HW8yzq8/i6rtRcHZgwyHdoaSklyaCSb4NsmAJKWy2jY=;
	h=From:Date:Subject:To:CC:References:From;
	b=jx/8JVczNUOhBLp4NcttMtzteCb0jHG/Dwq1FcdUKLF/ZwhPOR1IKLb84AwU4Ew04
	 YXeGeNHl30A1ZG3pZ69L9pQ+d685It9nb6nOdO4Xk5y/K1m5W2ygWsGAesemdf9NnO
	 HXhYLEh06vVxt2xX3xU9hFAlARfaRWB1HlWFmxK8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20250123132903eucas1p24543302f379895c3cd617b65ecaffe9a~dVWmasnrK0847708477eucas1p2g;
	Thu, 23 Jan 2025 13:29:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges3new.samsung.com (EUCPMTA) with SMTP id 9D.42.20397.F1442976; Thu, 23
	Jan 2025 13:29:03 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250123132902eucas1p19b0ae0230e5ac0bb0ce07d523f9a63c1~dVWmHRT-F1983519835eucas1p1z;
	Thu, 23 Jan 2025 13:29:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250123132902eusmtrp1997645c285a3f2f6a0dfbb1a065d2134~dVWmG0oYc1142311423eusmtrp1e;
	Thu, 23 Jan 2025 13:29:02 +0000 (GMT)
X-AuditID: cbfec7f5-e59c770000004fad-41-6792441fd83e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id E7.A6.19654.E1442976; Thu, 23
	Jan 2025 13:29:02 +0000 (GMT)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250123132902eusmtip279eb155d6c9dab819bd0bcc89688facf~dVWl9IrUe0125401254eusmtip2q;
	Thu, 23 Jan 2025 13:29:02 +0000 (GMT)
Received: from localhost (106.110.32.87) by CAMSVWEXC01.scsc.local
	(2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id
	15.0.1497.48; Thu, 23 Jan 2025 13:29:02 +0000
From: Daniel Gomez <da.gomez@samsung.com>
Date: Thu, 23 Jan 2025 14:28:48 +0100
Subject: [PATCH b4] fix Generator annotation type
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250123-fix-generator-type-v1-1-1e76428f9872@samsung.com>
X-B4-Tracking: v=1; b=H4sIAA9EkmcC/x2MywqAIBAAfyX23ELaC/qV6FC61V5UVolC+vek4
	8DMZIgkTBGmKoPQxZG9K6DqCsy5uoOQbWHQje4bpVvc+caDHMmavGB6AqEZR23NsPe2tVDCIFS
	sfzrD1sHyvh8Kku8JaAAAAA==
X-Change-ID: 20250123-fix-generator-type-c772dc6f5d3d
To: Kernel.org Tools <tools@kernel.org>
CC: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Daniel Gomez
	<da.gomez@samsung.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737638942; l=3415;
	i=da.gomez@samsung.com; s=20240621; h=from:subject:message-id;
	bh=pqx9CaPs+dpWwMa6NBowt+ioKCEWpsHa6uSnXFKgVLI=;
	b=I0WjaF6iaf22Jo6JlgMfp7myuqVi7uw8o9XCB9t0MoetxVObx57qHISdUYZXbqivO7hafrfWk
	fSyQYBMdvXjAN2IF/Wll7gbwsXKpEZiqMOHxB3Foz5TC9Erqt2QEknE
X-Developer-Key: i=da.gomez@samsung.com; a=ed25519;
	pk=BqYk31UHkmv0WZShES6pIZcdmPPGay5LbzifAdZ2Ia4=
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
	CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRmVeSWpSXmKPExsWy7djPc7ryLpPSDRr38lns/PyF0eLcxofM
	Dkwem1Z1snnsn7uGPYApissmJTUnsyy1SN8ugStj7+VO1oKbUhXnP+xgamB8JNrFyMEhIWAi
	sflnQhcjF4eQwApGiZmLbzBBOF8YJQ70XGWFcD4zStxpX8ME0zG1sQgivpxRomnzVya4omVN
	TcwQzhZGiV89K4AcTg42AU2JfSc3sYPYLAKqEq92d4LZwgKGEuf23GcFsXkFBCVOznzCArKB
	Gah+/S59kDCzgLzE9rdzmCFK3CUm9Z1jB5kvATL/SsdNRpCEhICpxO37b9lAbBEBdYmj17ex
	QjQnSKz69oYJokZU4vfkXSwQzfuZJM7fuskCkUiVWPHoDjOErSgxY+JKqHitxNpjZ9gh7DMc
	Eov2sEC87yJxcCHUTGGJV8e3QJXISJye3APVmi1x9vseqNtKJP59+AUVt5b4v/YuVNxRYvH9
	fvYJjOqzkLw/C+H9WUjeX8DIvIpRPLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMwPZz+d/zr
	DsYVrz7qHWJk4mA8xCjBwawkwvv/yYR0Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4ryL9remCwmk
	J5akZqemFqQWwWSZODilGpi2VFrMW/L+g/K68IT3l6XeH+J6MZVFQO8oj2LftQuXtf/dvPD5
	zcuZkcIMn9aImT1JVjz/zMkyRmUmQ9NElbM9526EqDhzSi2yKm7SO+/QWXSYwyNm2/9SRpZi
	nS8y7289Ke14q3SvkvXs3eD55zJ2SidoO/pKKnCL2TZxCH57cH950cKy77rppi8bPgprhcf3
	LJ/Tc+zLovc8p75P3N4mq3Z/3d8Hy6MYtXlz/92pvSu37//50wenWzi22NpJ+Vz/9lflR+sU
	36bKemvfsyd9+NZxl5jkKSqsaqosCJ7Qk+rdrbbR89dF06iblb1lwctmfP/E6lnWG+fm/3NC
	4UvP27Gp3JcqtDZNbbryKleJpTgj0VCLuag4EQBpuAr5fgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xe7pyLpPSDc78MbPY+fkLo8W5jQ+Z
	HZg8Nq3qZPPYP3cNewBTlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1N
	SmpOZllqkb5dgl7G3sudrAU3pSrOf9jB1MD4SLSLkYNDQsBEYmpjURcjF4eQwFJGid8f1jN3
	MXICxWUkNn65ygphC0v8udbFBlH0kVHixqw77BDOFkaJNXt+soNUsQloSuw7uQnMZhFQlXi1
	uxPMFhYwlDi35z7YJF4BQYmTM5+wgGxmBqpfv0sfJMwsIC+x/e0cZogSd4lJfefA5kuAzP82
	/SobxBWmErfvvwWzRQTUJY5e38YK0ZwgserbGyaIGlGJ35N3sUA072eS+NT+CyqRKrH9yhKo
	QYoSMyauZIGwayVe3d/NOIFRbBaS+2Yh3DcLyX0LGJlXMYqklhbnpucWG+kVJ+YWl+al6yXn
	525iBMbbtmM/t+xgXPnqo94hRiYOxkOMEhzMSiK8/59MSBfiTUmsrEotyo8vKs1JLT7EaAoM
	o4nMUqLJ+cCIzyuJNzQzMDU0MbM0MLU0M1YS52W7cj5NSCA9sSQ1OzW1ILUIpo+Jg1OqgUma
	8+sna+fNxQ6qAdFq4i89E43WHFd8Xznt3+eAJbONmP323BLb8m7JSd5HF3Q28Ww5KaF24Oum
	a90uFatP2h1OCmAty7twynlr5t31LwtXczEfNn0q/Hx250LBzFnlYnxP7a5OW7uNx37lJ1GF
	ygmyFsXW80VuPeaL7Fi3S6hu+nu/z7PmqNgt6vdk3sNobuYcfEh1eZ0Br1zkqb6M4HOm/Wvd
	voYL15T8Pvftj/lrTW/5KCGGtwm3bA/7ry6W0vtqPHfBvPXOS34qphWqHF21dcatS694zMOq
	2X3mb1wSt4+nQvdelyVXiPfio19Tw5UvSL2d1/0yuGv/o1srU+cUpRceuXGIpUt5zqNZpTFK
	LMUZiYZazEXFiQCEr3wZQAMAAA==
X-CMS-MailID: 20250123132902eucas1p19b0ae0230e5ac0bb0ce07d523f9a63c1
X-Msg-Generator: CA
X-RootMTR: 20250123132902eucas1p19b0ae0230e5ac0bb0ce07d523f9a63c1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250123132902eucas1p19b0ae0230e5ac0bb0ce07d523f9a63c1
References: <CGME20250123132902eucas1p19b0ae0230e5ac0bb0ce07d523f9a63c1@eucas1p1.samsung.com>

Generator type arguments in Python 3.12 are not set to None by default.
Set them explicitly to avoid error below in distros with Python 3.12.

Error:
./b4.sh -h
Traceback (most recent call last):
  File "/media/tarkir/dagomez/src/mricon/b4/src/b4/command.py", line 10, in <module>
    import b4
  File "/media/tarkir/dagomez/src/mricon/b4/src/b4/__init__.py", line 2784, in <module>
    def git_temp_worktree(gitdir: Optional[str] = None, commitish: Optional[str] = None) -> Generator[str]:
                                                                                            ~~~~~~~~~^^^^^
  File "/usr/lib/python3.12/typing.py", line 398, in inner
    return func(*args, **kwds)
           ^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3.12/typing.py", line 1482, in __getitem__
    _check_generic(self, params, self._nparams)
  File "/usr/lib/python3.12/typing.py", line 304, in _check_generic
    raise TypeError(f"Too {'many' if alen > elen else 'few'} arguments for {cls};"
TypeError: Too few arguments for typing.Generator; actual 1, expected 3

Fixes 2801becd386bf9b3c8947421f3ef20442def2a58 ("Correctly type annotate
generators").

Signed-off-by: Daniel Gomez <da.gomez@samsung.com>
---
Generator type in Python 3.12 does not set second and third arguments
(SendType and ReturnType) to None by default [1] [2] as they do in
Python 3.13.

Tested on Debian Testing with Python 3.12.8.

[1] https://docs.python.org/3.13/library/typing.html#annotating-generators-and-coroutines
[2] https://docs.python.org/3.12/library/typing.html#annotating-generators-and-coroutines
---
 src/b4/__init__.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 06f3cd3e84f3993230fd78653d64fef1f4b51960..4d234e01d9932fc600103bf62c1cb109b1eac201 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2781,7 +2781,7 @@ def git_get_repo_status(gitdir: Optional[str] = None, untracked: bool = False) -
 
 
 @contextmanager
-def git_temp_worktree(gitdir: Optional[str] = None, commitish: Optional[str] = None) -> Generator[str]:
+def git_temp_worktree(gitdir: Optional[str] = None, commitish: Optional[str] = None) -> Generator[str, None, None]:
     """Context manager that creates a temporary work tree and chdirs into it. The
     worktree is deleted when the contex manager is closed. Taken from gj_tools."""
     dfn = None
@@ -2799,7 +2799,7 @@ def git_temp_worktree(gitdir: Optional[str] = None, commitish: Optional[str] = N
 
 
 @contextmanager
-def git_temp_clone(gitdir: Optional[str] = None) -> Generator[str]:
+def git_temp_clone(gitdir: Optional[str] = None) -> Generator[str, None, None]:
     """Context manager that creates a temporary shared clone."""
     if gitdir is None:
         topdir = git_get_toplevel()
@@ -2817,7 +2817,7 @@ def git_temp_clone(gitdir: Optional[str] = None) -> Generator[str]:
 
 
 @contextmanager
-def in_directory(dirname: str) -> Generator[bool]:
+def in_directory(dirname: str) -> Generator[bool, None, None]:
     """Context manager that chdirs into a directory and restores the original
     directory when closed. Taken from gj_tools."""
     cdir = os.getcwd()

---
base-commit: 764bbf5525f4894c5482753ed73a19dbbd7a2564
change-id: 20250123-fix-generator-type-c772dc6f5d3d

Best regards,
-- 
Daniel Gomez <da.gomez@samsung.com>


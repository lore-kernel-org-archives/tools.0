Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE63C157A5B
	for <tools@linux.kernel.org>; Wed, 26 Jun 2024 19:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719430555; cv=none; b=iQBiiEN6Zqj6GapkJDtuwM0Jj7xDhBriFXHgE9BLi2DvNUIp3EmfDUKZk4t7Mw46rP0RIL7yGLC9BwVYbgwtZenHVeTOM53O96n88r11M5wEnqCJPvOQOXo79mooSa18VrcmtOpcVVXsTQ6E43RMbro9ygArCE+x342776RgUR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719430555; c=relaxed/simple;
	bh=ON1jPlZQUF4scfMPrC/LBo1ImrOR18Nc+lFT40a/r3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QIbNFYUmdqqMBVmiOHXA7k9D13VxKKn5DTs4BW5yy2bhVQzRXBKKKGCL3L6N9GdcNfhp/N40HfCGiFrpovPD9XyZ9sydM1278CRrWWb11NP2Cm0PIyHOwSMUeoVM2l2tCsbHZpaXgxVdx7RAihNNv4BgoGUgb6NgKXys/Bggaw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com header.b=aYiQH99u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com header.b="aYiQH99u"
Received: by smtp.kernel.org (Postfix)
	id CA615C32786; Wed, 26 Jun 2024 19:35:54 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com [67.231.152.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 673F7C116B1
	for <tools@kernel.org>; Wed, 26 Jun 2024 19:35:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 673F7C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=collins.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collins.com
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
	by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 45QIv65G017473;
	Wed, 26 Jun 2024 19:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=4wThJNWQj+Qm1oTBpBxWHrjjoZKy0EhR/tI5zA8aarM=;
 b=aYiQH99u1ocMEZM1Qd00QmHvTixet+6O9OGb8VkM8nfnUpK2itBdVq9mcsY7RJV/dOND
 g991Y4zZv4NdnZqUdjvsJvw/dx/9bp4qB2Y7LjCL3VuiuGnUlCZVq4xyvug7DSQVL7FQ
 fcgSUFkKynZJ1oo/5bXVcblFeaPwIcPfcsLwUg3kmxSvpS/nPQSPTH9LaJQx+z79p1UO
 Q01kahnELtHlDpDZGW80I6r4ff/D1mfQn7IO1iVu5NsnwG7Xo2OZ6FBxsF8KUx5nVSoz
 2bHHaoTOyTr98dNsLV4QKzgneEj/fQpKoms85K9Y38BG6IKK94RfVclPLMtsK7/RHyET qQ== 
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
	by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 400nvbu3r0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2024 19:35:44 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
	by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QJZhVd027729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jun 2024 19:35:43 GMT
Received: from ciulimr02.rockwellcollins.com (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
	by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QJZhTS023644
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 26 Jun 2024 19:35:43 GMT
X-Received: from localhost (unknown [10.148.204.208])
	by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 221241002820;
	Wed, 26 Jun 2024 14:35:43 -0500 (CDT)
From: Brandon Maier <brandon.maier@collins.com>
Date: Wed, 26 Jun 2024 19:34:46 +0000
Subject: [PATCH b4] Fix prep-perpatch-check-cmd in .b4-config
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240626-b4-config-check-cmd-v1-1-83fc971196f9@collins.com>
X-B4-Tracking: v=1; b=H4sIAFVtfGYC/x3MQQqEMAxA0atI1hNoYxGdq8gsbEw1yFRpQYTi3
 S0u3+L/AlmSSoZvUyDJqVn3WGE/DfA6xUVQ52ogQ8501KF3yHsMuiCvwhvyf0ayJpjB02DbHmp
 5JAl6vdcRvIPffT/4D46EaQAAAA==
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Brandon Maier <brandon.maier@collins.com>
X-Mailer: b4 0.15-dev
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_12,2024-06-25_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_11,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 suspectscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2406180000 definitions=main-2406260143
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 phishscore=0 mlxscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2406180000
 definitions=main-2406260142
X-Proofpoint-GUID: aJBd_kxUd0M1k12wXTQvSkSR3w9cTwYG
X-Proofpoint-ORIG-GUID: aJBd_kxUd0M1k12wXTQvSkSR3w9cTwYG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_11,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0 adultscore=0
 mlxscore=0 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1011 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2406180000 definitions=main-2406260142

Trying to use the 'prep-perpatch-check-cmd' config from a repo
with '.b4-config' fails. For example as follows

  $ b4 --version
  0.14.0
  $ printf '[b4]\n\tprep-perpatch-check-cmd = "true"\n' >.b4-config \
        && git add .b4-config && git commit -m b4-test
  $ b4 prep --check
  Checking patches using:
    t
    r
    u
    e
  ---
  Traceback (most recent call last):
    File "/home/blmaier/.local/bin/b4", line 8, in <module>
      sys.exit(cmd())
               ^^^^^
    File "/home/blmaier/.local/lib/python3.12/site-packages/b4/command.py", line 417, in cmd
      cmdargs.func(cmdargs)
    File "/home/blmaier/.local/lib/python3.12/site-packages/b4/command.py", line 83, in cmd_prep
      b4.ez.cmd_prep(cmdargs)
    File "/home/blmaier/.local/lib/python3.12/site-packages/b4/ez.py", line 2822, in cmd_prep
      return check(cmdargs)
             ^^^^^^^^^^^^^^
    File "/home/blmaier/.local/lib/python3.12/site-packages/b4/ez.py", line 1707, in check
      ckrep = b4.LoreMessage.run_local_check(ppcmdargs, commit, msg, nocache=cmdargs.nocache)
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/home/blmaier/.local/lib/python3.12/site-packages/b4/__init__.py", line 1522, in run_local_check
      ecode, out, err = _run_command(cmdargs, stdin=bdata, rundir=topdir)
                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/home/blmaier/.local/lib/python3.12/site-packages/b4/__init__.py", line 2650, in _run_command
      sp = subprocess.Popen(cmdargs, stdout=subprocess.PIPE, stdin=subprocess.PIPE, stderr=subprocess.PIPE)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    File "/usr/lib64/python3.12/subprocess.py", line 1026, in __init__
      self._execute_child(args, executable, preexec_fn, close_fds,
    File "/usr/lib64/python3.12/subprocess.py", line 1955, in _execute_child
      raise child_exception_type(errno_num, err_msg, err_filename)
  FileNotFoundError: [Errno 2] No such file or directory: 't'

The problem is 'prep-perpatch-check-cmd' is the special 'multival' type
(Python list). But when the .b4-config is imported it does not specify
the multival types, so it gets imported as a string. When b4 tries to
call the check-cmd later on, it gets iterated over as if it were a list
but instead returns each character.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 src/b4/__init__.py | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 7164d3f..1f89280 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -2840,6 +2840,14 @@ def get_config_from_git(regexp: str, defaults: Optional[dict] = None,
     return gitconfig
 
 
+def _val_to_path(topdir, val):
+    if val.startswith('./'):
+        # replace it with full topdir path
+        return os.path.abspath(os.path.join(topdir, val))
+    else:
+        return val
+
+
 def _setup_main_config(cmdargs: Optional[argparse.Namespace] = None) -> None:
     global MAIN_CONFIG
 
@@ -2848,23 +2856,24 @@ def _setup_main_config(cmdargs: Optional[argparse.Namespace] = None) -> None:
     # so load them up and use as defaults
     topdir = git_get_toplevel()
     wtglobs = ['prep-*-check-cmd', 'send-*', '*mask', '*template*', 'trailer*', 'pw-*']
+    multivals = ['keyringsrc', 'am-perpatch-check-cmd', 'prep-perpatch-check-cmd']
     if topdir:
         wtcfg = os.path.join(topdir, '.b4-config')
         if os.access(wtcfg, os.R_OK):
             logger.debug('Loading worktree configs from %s', wtcfg)
-            wtconfig = get_config_from_git(r'b4\..*', source=wtcfg)
+            wtconfig = get_config_from_git(r'b4\..*', multivals=multivals, source=wtcfg)
             logger.debug('wtcfg=%s', wtconfig)
             for key, val in wtconfig.items():
-                if val.startswith('./'):
-                    # replace it with full topdir path
-                    val = os.path.abspath(os.path.join(topdir, val))
+                if key in multivals:
+                    val = [_val_to_path(topdir, x) for x in val]
+                else:
+                    val = _val_to_path(topdir, val)
                 for wtglob in wtglobs:
                     if fnmatch.fnmatch(key, wtglob):
                         logger.debug('wtcfg: %s=%s', key, val)
                         defcfg[key] = val
                         break
-    config = get_config_from_git(r'b4\..*', defaults=defcfg,
-                                 multivals=['keyringsrc', 'am-perpatch-check-cmd', 'prep-perpatch-check-cmd'])
+    config = get_config_from_git(r'b4\..*', defaults=defcfg, multivals=multivals)
     config['listid-preference'] = config['listid-preference'].split(',')
     config['listid-preference'].remove('*')
     config['listid-preference'].append('*')

---
base-commit: 131835a44c63511e2def9d7adc680754b7ea502c
change-id: 20240626-b4-config-check-cmd-210f09b29138

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>


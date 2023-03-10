Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6383A5E
	for <tools@linux.kernel.org>; Fri, 10 Mar 2023 06:01:36 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PXwRL3pSDz4whh;
	Fri, 10 Mar 2023 17:01:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678428094;
	bh=S5hcxdr8eOtuqGmtVge4qrbAaaJirDmo5gdK90AP20U=;
	h=From:To:Subject:Date:From;
	b=QirX7wBdYYhO/UbaetXdIk6r3iYc6WI6i65+cS/7Lq2CRRb+1Fu2AesLP3v0T4uXE
	 03hyytYD9xsOx/0GUcOBhmWG5TBTLZ+oF3AlESvLjUlmzw7HA8tf7HRUFeGnNzXYcz
	 SVW73h+guUNSCNt3BinpXwsF5JIpCr6KB6O0FSrf+y6GRi5zr6GqgTM5EDYBJ62xKm
	 YnFkcuePePzohYdm9LSP2iFEI/g4kzoX6ObhCeUHKtPIi5ZpcSvfQrbqJ0ERdU58CK
	 86Fv7Gsh14kHiek0QCfj0cPB94kBX/WAXxqkRFpg2Lr8jA49XpVJfvZS8QJbyFpbhh
	 FA4p8f1un4XFA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: tools@linux.kernel.org
Subject: [PATCH] ty: Allow a custom name/from when sending thanks
Date: Fri, 10 Mar 2023 17:01:33 +1100
Message-Id: <20230310060133.1610255-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add config options "thanks-from-name" and "thanks-from-email" that
allow setting a custom name and/or from address when sending thanks.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 b4/ty.py        |  8 +++++---
 docs/config.rst | 14 ++++++++++++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/b4/ty.py b/b4/ty.py
index 15b02ed..165afd9 100644
--- a/b4/ty.py
+++ b/b4/ty.py
@@ -440,13 +440,16 @@ BRANCH_INFO = None
             os.mkdir(cmdargs.outdir)
 
     usercfg = b4.get_user_config()
+    config = b4.get_main_config()
+    user_name = config.get('thanks-from-name', usercfg['name'])
+    user_email = config.get('thanks-from-email', usercfg['email'])
     signature = b4.get_email_signature()
 
     outgoing = 0
     msgids = list()
     for jsondata in listing:
-        jsondata['myname'] = usercfg['name']
-        jsondata['myemail'] = usercfg['email']
+        jsondata['myname'] = user_name
+        jsondata['myemail'] = user_email
         jsondata['signature'] = signature
         if 'pr_commit_id' in jsondata:
             # This is a pull request
@@ -489,7 +492,6 @@ BRANCH_INFO = None
         logger.info('No thanks necessary.')
         return
 
-    config = b4.get_main_config()
     pwstate = cmdargs.pw_set_state
     if not pwstate:
         pwstate = config.get('pw-accept-state')
diff --git a/docs/config.rst b/docs/config.rst
index 389badf..c43f32d 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -257,6 +257,20 @@ These settings control the behaviour of ``b4 ty`` command.
 
   Default: ``None``
 
+``b4.thanks-from-name`` (v0.13+)
+  An custom from name for sending thanks, eg::
+
+      thanks-from-name = Project Foo Thanks Bot
+
+  Default: ``None`` - falls back to user name.
+
+``b4.thanks-from-email``
+  An custom from email for sending thanks, eg::
+
+      thanks-from-email = thanks-bot@foo.org
+
+  Default: ``None`` - falls back to user email.
+
 ``b4.email-exclude`` (v0.9+)
   A comma-separated list of shell-style globbing patterns with addresses
   that should always be excluded from the recipient list.
-- 
2.39.2


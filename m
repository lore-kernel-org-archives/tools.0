Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0CA1E47DD
	for <tools@linux.kernel.org>; Fri,  8 Nov 2024 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731069150; cv=none; b=Y7Fb4aa5t9XmD/5Lz3fWFUY/xXRixMbPpgYYNTBSy2p4ei/dMOavc4Cmh5d6xxzNdBrf5AXqzIDcFRTQgJ7HFIKGhO4GmXHDYuizqvpibwK9aPOAN2+x0eToMMnvrV44OmpyUTDrM74X08GWreIv9Af7Vc6N9Hv5Sb14Le6fNfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731069150; c=relaxed/simple;
	bh=ecBBbS2r8kD9WOsPe4beqtgZGSk6w/nGpThSSF4MMpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SztZFklwyMJRWqJCtTdNg0asq4E19UlVAFq78XmfzSrFx3vgyc+GcZchmg740ClTrBhFlrRuirrdXXc1Hgn2lgnUlGCL0blRa8B7xG3FdRtzrWntRRyuJK05rqU/tF1OuFpJ5TRo9960HyLb113Jnof8BlE7BOMkCMoWG8D6z68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OdS1pQgc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OdS1pQgc"
Received: by smtp.kernel.org (Postfix)
	id 4FFB6C4CEDB; Fri,  8 Nov 2024 12:32:30 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 31CB4C4CED5
	for <tools@kernel.org>; Fri,  8 Nov 2024 12:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 31CB4C4CED5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b14f3927ddso128117685a.3
        for <tools@kernel.org>; Fri, 08 Nov 2024 04:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731069148; x=1731673948; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0L9oFF0+WXBfuPTzvFfgUZLcEhkaBrfpsLlCG+qdW94=;
        b=OdS1pQgcnUpRrumB6gV0WpD/z2ZboJiEuGI6KZip6SI6Xc8idpzvMNPwxSuhTI/eBe
         8/RNAD51ZsnadtS66dloJham24Cc5DoeU34Vv+AsLmDfyzoS1tVqMM/jOaDBelFRCImU
         77bAbgTRkzt24dy5hnv1NyQ83ZDBZCzbb0m/RiorCiHq8cRszLoLg99BS8w2+p6hl8RF
         auOp4vCHbrVS++6svfqe2LZYeW4/qaXuHKJ2c7nGhikVhBcWdC/5gCIB6kHrnBikN3Ci
         Uz6QW5hALpWaKWC5IqmG6Bax+Swj3IFCkmJm5F5WEzfnkEu8HkFldVSb/3RtV5A26r4i
         Y//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731069148; x=1731673948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0L9oFF0+WXBfuPTzvFfgUZLcEhkaBrfpsLlCG+qdW94=;
        b=egtrbsBD7glo/vDi5JGDPc5L9m+p+iFljw9rJo7Qf2c3a4yWl3RqXtXETE5uycctDX
         /JmsrhvXI5SRpWmNEsTDYH6rPjTVvTCgtJFHUG72TvcRoVxTuuYP7rn6UTagT5sQTDXc
         qW6tvH0LWeAn/4zFizMPJ3NlJFwpNSBvnxSHJ5RxpFrv3v4dvt4ZTlDiIGmgtui1V5wR
         IC60suN116zNkLBq/BQQggG1Oyy/Tw+dtw4HG9zZU1IcGQPMYlzabcNPGL6wnIq5B+U2
         WW2Mug6PbNa3hgs4ofOeOEfWEMofzV6dT/PBFSAB+YDynMilAAL/HBb+4OPKlQ0BiJ9b
         1UdQ==
X-Gm-Message-State: AOJu0YyO2ztG9XeBaXHy+YBZ0AdqqRb1nVB4GyBb+ijpHcXf4exuCjCe
	0E14yrOYappimyTTAqTo/vbIWniF+pB+c5rhF3X/aomoYe8szfqyL8LLXrUr
X-Google-Smtp-Source: AGHT+IHP2xsY1i6W/+lU5tYoSHZT471zIffznOoyf2VI+9gdwHfOV9KA7aPxmaB1VcpsLEkTaTy+cA==
X-Received: by 2002:a05:6214:3bc7:b0:6bf:6ef6:22d5 with SMTP id 6a1803df08f44-6d39e16b233mr38832156d6.17.1731069148015;
        Fri, 08 Nov 2024 04:32:28 -0800 (PST)
Received: from 159.1.168.192.in-addr.arpa ([2600:4041:5be7:7c00:348d:4cbf:ba75:f557])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3961ef48csm18633436d6.35.2024.11.08.04.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 04:32:26 -0800 (PST)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 08 Nov 2024 07:31:32 -0500
Subject: [PATCH RESEND b4 5/5] Add missing imports
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-better-type-annotations-v1-5-ebaf0129d9e1@gmail.com>
References: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
In-Reply-To: <20241108-better-type-annotations-v1-0-ebaf0129d9e1@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 src/b4/__init__.py         | 9 +++++----
 src/b4/diff.py             | 1 +
 src/b4/ez.py               | 2 ++
 src/b4/pr.py               | 2 ++
 src/b4/ty.py               | 1 +
 src/tests/test___init__.py | 1 +
 6 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index e71fbe7d8ea8d4ca19228690ce7c186cc91b81ad..7b1925da93e1b3feadf669cc188ab6fb030f67f4 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -8,12 +8,13 @@ import sys
 import gzip
 import os
 import fnmatch
-import email.utils
-import email.policy
-import email.parser
-import email.header
 import email.generator
+import email.header
+import email.message
+import email.parser
+import email.policy
 import email.quoprimime
+import email.utils
 import tempfile
 import pathlib
 import argparse
diff --git a/src/b4/diff.py b/src/b4/diff.py
index 743127ef0a1922eace81686e27cd0366f8e42f9c..1de3063ea0b3c73e4e3d8bfd4ec91b4c6f90cce6 100644
--- a/src/b4/diff.py
+++ b/src/b4/diff.py
@@ -11,6 +11,7 @@ import b4
 import b4.mbox
 import mailbox
 import email
+import email.message
 import email.parser
 import shutil
 import pathlib
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 970631592d2139b12ee4a6a9a112081eee1de721..9494b005a4f47a7be9cb053cc6075dede29d4cb0 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -17,6 +17,8 @@ import datetime
 import json
 import shlex
 import email
+import email.policy
+import email.utils
 import pathlib
 import base64
 import textwrap
diff --git a/src/b4/pr.py b/src/b4/pr.py
index b6eb5d3933d7e0bb1224877f071bb19facd8dbd8..60f46f1e3fa96a52a9d667bffb43c2a75b89cc4e 100644
--- a/src/b4/pr.py
+++ b/src/b4/pr.py
@@ -13,7 +13,9 @@ import b4
 import re
 import json
 import email
+import email.message
 import email.parser
+import email.utils
 import argparse
 
 import urllib.parse
diff --git a/src/b4/ty.py b/src/b4/ty.py
index e1afb61280d2161a054d40ae78df0d4b33dbb41d..021588ff9e559cfd8aa7c6818cdeba750931e8f6 100644
--- a/src/b4/ty.py
+++ b/src/b4/ty.py
@@ -13,6 +13,7 @@ import re
 import email
 import email.message
 import email.policy
+import email.utils
 import json
 import argparse
 
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 297e5120a8c8adf241660f06e9a83c1ff4a0fd3a..3e01c2f5e127cd1123d0fb8503493e396148ee73 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -35,6 +35,7 @@ def test_save_git_am_mbox(sampledir, tmp_path, source, regex, flags, ismbox):
             msgs = list(mbx)
         else:
             import email
+            import email.parser
             with open(f'{sampledir}/{source}.txt', 'rb') as fh:
                 msg = email.parser.BytesParser(policy=b4.emlpolicy, _class=email.message.EmailMessage).parse(fh)
             msgs = [msg]

-- 
2.47.0


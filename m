Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198601FB8BF
	for <tools@linux.kernel.org>; Fri, 25 Oct 2024 20:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729887391; cv=none; b=LTzJZIqxDu0SspCFzY9oZPr1FsfMbnjpbEGXIzyL0mBcgcX4UHp1HP9FiaWN+UYS5orZp6oKWrGgID0VQOamkMD8ZdJinPM1RQQ+s+7ZtQawSjcOh+GsfqdSCu6o3UdDEheB6e2+1gfATW7oixqNIWUpuMrRmrvzOCf1TioOCVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729887391; c=relaxed/simple;
	bh=ecBBbS2r8kD9WOsPe4beqtgZGSk6w/nGpThSSF4MMpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZrnJ+8C9DQno0eBMEYNo2y0j9VW8TA8wpNX8WvjvA/5ozgyjKu9NXcchv++fBDFU6mlD8ySvE4eVaTgNYIH1sf9LOrjNlyVOEenmTc2tdQTVhH+6R+TwKAAS4StMuIOQ2lZzx4U5aPQFtAybgMRY4EVpFDUbEMtM9B3Vg7SK394=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cG9/lV69; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cG9/lV69"
Received: by smtp.kernel.org (Postfix)
	id 0F810C4CECC; Fri, 25 Oct 2024 20:16:31 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2040FC4CEC3
	for <tools@kernel.org>; Fri, 25 Oct 2024 20:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2040FC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4608da1bea5so19324831cf.1
        for <tools@kernel.org>; Fri, 25 Oct 2024 13:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729887389; x=1730492189; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0L9oFF0+WXBfuPTzvFfgUZLcEhkaBrfpsLlCG+qdW94=;
        b=cG9/lV69Yb0+zKv6a3CboJwYs4yuFoApD3LD/zUqPCCHa3sg4FioT0ccUTGpEo2zbk
         fwGJkwb3EzK2hbHgdU5GyV6DQVOf78O6SGT5e7lthrVGq+s+knIMZwf32hi6rF71r2N3
         h8ffpgkg4pMh2dIhu35xbW8jZobEZfH5jRel8QoIpwJjoqWYBSXXpfTeruvmf1Ea7RFm
         ata5Nbezy/DUiossz4Ge88NpE9CoRkiImH5UZv49yIR0YQb9XJdlEzjcVx9pJ1TnVeOz
         hWavu/xCIxxsIbjngZomoIFgiaBEt7MsJaD5ncynlAvvd1BfNo20S/eiELwyYnMTumQn
         l8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729887389; x=1730492189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0L9oFF0+WXBfuPTzvFfgUZLcEhkaBrfpsLlCG+qdW94=;
        b=vq9or5/45haC0+XRtzS1+UDxzVbboIoFn108Hmcbf/YqZbGLWpqCTA9j548TZCfrM4
         KU84xXDTiTSHUIlSzK6WnJ3Dhdq+Kh9GJ3KyP7GZpLCMbfvjE1Gx1g71bbQpNEKqwmo0
         k665R7U4GSLJMinYDh0+9oAJfMAFMKYfIHcwU1oGwHsWU3/evyOvhaOGQXzgSW8TpAMX
         ImCwMEiyYM+SrsoHHxRTOzD/wqAkBYlx6AZNzbXafT+KOnkb5Pym+S+Gfqjm6K7WC8lC
         lBRrfy1S6yELJI7FdlzfSeSpwoKQYTOxmZGTWxp34IPz7R8fdNqARdBgCQYOKawuK90x
         iUZg==
X-Gm-Message-State: AOJu0YwlNwjSZ41rMn65MvXIK1KaGGoEC8KbO6YXQFgmbguCjUV8Rk8f
	nBujeMLqqi3+BmdSQKE5esKFFHlIr6ccg86ocUxQwu9HMWcF8EAY
X-Google-Smtp-Source: AGHT+IHZaa/L731PsAy+B6UmX/9ytg4gKoKYThDuN2FiVTIMWGe88QjRwJ8ZVZs2fb+KVNNrG1uDAg==
X-Received: by 2002:a05:622a:15cf:b0:45d:9357:1cca with SMTP id d75a77b69052e-4613c00ed2bmr5978421cf.14.1729887389035;
        Fri, 25 Oct 2024 13:16:29 -0700 (PDT)
Received: from 156.1.168.192.in-addr.arpa (pool-100-37-170-231.nycmny.fios.verizon.net. [100.37.170.231])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4613237f394sm9124491cf.65.2024.10.25.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 13:16:27 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 25 Oct 2024 16:16:07 -0400
Subject: [PATCH b4 5/5] Add missing imports
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-better-type-annotations-v1-5-9d7a00a8d754@gmail.com>
References: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
In-Reply-To: <20241025-better-type-annotations-v1-0-9d7a00a8d754@gmail.com>
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


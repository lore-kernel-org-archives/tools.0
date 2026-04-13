Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD3A39A051
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 22:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118117; cv=none; b=TY934PdZQ9ydKcWzNBbai9jx9rBZhIwfgBuf0EHQ/oqxCtGpkxuy76pXnk7W0GmxUDC+F94U0YXumd4rJuVVRO/J45+gACQJdOZO3ow2XzCJEKsHJAdzwDBxfxIsKMBPyaMsaRJwgiq0pQFpVVK45w1OI+NR9LcbHtuwudm/DGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118117; c=relaxed/simple;
	bh=KgTS4QfBnDUyb+OW/vGrYCWXNZpzDvAtowbRRwjn9uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HZbBNMVnqSk0HjzGMfn8gt7E5PY6jBmNExIc8MTImG8iOAomy4BaB986W/9iv0zlGl2PhbncSCB9yDbAd6z7Zbbg4lL1Cb7e/cRZF2VuayzBmI9s9fVjJQV/8YxQvQ8vbwG0RaGA6VM6IfyWvUx6lQX7SFipTX6fbAsPqlW1etk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sOy7zH3k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sOy7zH3k"
Received: by smtp.kernel.org (Postfix)
	id F1EDAC2BCC7; Mon, 13 Apr 2026 22:08:36 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 072FAC2BCB5
	for <tools@kernel.org>; Mon, 13 Apr 2026 22:08:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 072FAC2BCB5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8cfd44fa075so577034085a.0
        for <tools@kernel.org>; Mon, 13 Apr 2026 15:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118115; x=1776722915; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4020ywEe3Pjp2+4HQpidyOK7iIwYsc50M1F9yg+CpA=;
        b=sOy7zH3kyxojREIaVn6Pm/hz24PXMhiATx22mh95mvsJOa16W6/z+Wf3f66De7i7Vf
         3PjEUsS6DSrduNbXVjPK395b2LqsYyA6gfNm3voon2g7qxTJMKKJCXUbWltzfRGLr2TX
         Yu6v2IfrvzbgEbk4zpVow8igeevh5BXzR3fVhVx62J6zeLuFh6kfC/OQ0EZiBnN0Wji1
         9S2+x0QBINuR4ndCOWHKM86PBxG4fnePEhQH9Dn+EPspm55ZUo5RESx0ZgUnwcbZ0WVR
         3a8rVpq8TA2KwVKDLv1lik8At6y9VemGg7/JGRCj76/LZb+OuiXcmGuCahakM+fBQqPB
         InDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118115; x=1776722915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4020ywEe3Pjp2+4HQpidyOK7iIwYsc50M1F9yg+CpA=;
        b=jPpGjdrShz3ypVYf1GYdT8BrSdY8p10R3DP1mTkTDgel4VXz3QNIZ3uYgBUntOc7KY
         1z2iBmi74KMvpFGECCNuxdOMGEEa/YfzrvEE2qKmGePbz8afNdoc12hn6OSpqxKGIOB+
         PGdKXO6pNYxxH9HtqCtmrSjAKvyY1TQK3YQlAUoVO9FHJ+QBSyb2sjB3sHtG+ouMhoxM
         WbVy74oigXG6pet1O/M2GEFIIQNQpi7koOE3aw+DQ0JXi/6/XaeTddAb9yy7tF44gnCH
         m6SSD+fbhxNEHst5KknQLj4sfRzPk+jCExII22nGqCnw/GK/x1YteTbJ+qqV80wOFNI+
         7Nvg==
X-Gm-Message-State: AOJu0Yy/WmYpFY3Nmo+mkq5OLPB2wv8Wx1mQLx/4e44JjovsZPlG/Ym7
	eIk7cS2zHhtqf0gnw+T8yd4/tiFj7pWXUiwA5IliYguFJabp1rTr3IfUCWTmDg==
X-Gm-Gg: AeBDiesfwSu7kZWB8x6rdChk1nIGutMonxNG3MpnYP4MPdtNLwAOTJKnqi2P7yGsb0S
	o7MdC0TtU1rMT2yfLINuClYDjs+7ix7jWyYiaGUGRw5OiU+d4BKt/km7xe5ym2Zgmt9lxBRFZ4z
	ymYWLB2Sq/CSeO2hf/mqpYUYAnOx1oCoEiSwNn09eIPCt/SY/SahMJk6EB0idvLSZjTSZKDH+6k
	0nje/GTHcO2kEpLKHH3ur/JexXRs6yY29DX1B21zpSkoB+Tkcfk09YxgMYlLAANtZkME74mj0/O
	vRRbj0POPJNx7X65LM7PTwLcwRGMIOJqv/IXqeZ/THizui17V5ToJ5+qC0hkPiGS+JFNXFcgD1H
	NlbGDtAqHxvF/kegHAwxRfj5HtbAQNr7YhpjmqmUAYe4lcta8GU4Z0Co3eFFi0xsWuYlsUoiP9I
	fBJ5z5ymbWCuSZ+vNYpL274dg2mL66yjRZ1vCkGKtJ3J2RYwFj8i9MQd3EeKv6upYv4Q5KuGW4c
	ZEakXE6aoisfanwbYRJK0GsnAt73oh3pcZ7uEYtXbEikMQBf7NyT/RG/zDiJV7MNVtloRB7zEaq
	X2IlzS9ik25frx2GIXKI8HOcF3QSEPmKRIig1/kCijFmnIrE1gazky2THSpi9to2
X-Received: by 2002:a05:620a:4055:b0:8da:384b:9545 with SMTP id af79cd13be357-8ddccb2f661mr2158269185a.12.1776118114930;
        Mon, 13 Apr 2026 15:08:34 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4808:6353:5c00:c007:ed8:60aa:a884])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb8d6e387sm907506185a.30.2026.04.13.15.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 15:08:34 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 13 Apr 2026 18:08:26 -0400
Subject: [PATCH v2 12/14] Use CompletedProcess in git config tests
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-harden-type-checking-v2-12-1ba6056288d9@gmail.com>
References: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
In-Reply-To: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1776118099; l=6277;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=KgTS4QfBnDUyb+OW/vGrYCWXNZpzDvAtowbRRwjn9uc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QD8w0SoWGxgbsv2ZRD9JJ77k6luGWYKZvPJkL+qEW5x4Q3vxl7fgd4EKxQzfjn1hOZlsdAzoRHl
 SaKmzThA+NwY=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Replace MagicMock subprocess results with real
subprocess.CompletedProcess values in the git config helper tests. This
keeps the behavior the same while giving the mocks a concrete,
type-checked shape.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 tests/test_node.py | 77 +++++++++++++++++++++++++++++++-----------------------
 1 file changed, 45 insertions(+), 32 deletions(-)

diff --git a/tests/test_node.py b/tests/test_node.py
index 73c79a3..89be909 100644
--- a/tests/test_node.py
+++ b/tests/test_node.py
@@ -5,6 +5,7 @@ from __future__ import annotations
 
 import gzip
 import os
+import subprocess
 from datetime import datetime, timezone
 from email.message import EmailMessage
 from unittest.mock import MagicMock, call, patch
@@ -1557,15 +1558,17 @@ class TestGetConfigFromGit:
         """Parses git config -z output correctly."""
         from liblore.node import _get_config_from_git
 
-        mock_result = MagicMock()
-        mock_result.returncode = 0
-        mock_result.stdout = (
-            'lore.fallback\nhttps://tor.lore.kernel.org\x00'
-            'lore.fallback\nhttps://sea.lore.kernel.org\x00'
-            'lore.autoprobe\ntrue\x00'
-            'lore.probettl\n7200\x00'
+        result = subprocess.CompletedProcess[str](
+            args=['git'],
+            returncode=0,
+            stdout=(
+                'lore.fallback\nhttps://tor.lore.kernel.org\x00'
+                'lore.fallback\nhttps://sea.lore.kernel.org\x00'
+                'lore.autoprobe\ntrue\x00'
+                'lore.probettl\n7200\x00'
+            ),
         )
-        with patch('liblore.node.subprocess.run', return_value=mock_result):
+        with patch('liblore.node.subprocess.run', return_value=result):
             cfg = _get_config_from_git(r'^lore\.', multivals=['fallback'])
 
         assert cfg == {
@@ -1593,10 +1596,12 @@ class TestGetConfigFromGit:
         """Returns empty dict when no keys match the regexp."""
         from liblore.node import _get_config_from_git
 
-        mock_result = MagicMock()
-        mock_result.returncode = 1
-        mock_result.stdout = ''
-        with patch('liblore.node.subprocess.run', return_value=mock_result):
+        result = subprocess.CompletedProcess[str](
+            args=['git'],
+            returncode=1,
+            stdout='',
+        )
+        with patch('liblore.node.subprocess.run', return_value=result):
             cfg = _get_config_from_git(r'^lore\.')
 
         assert cfg == {}
@@ -1605,10 +1610,12 @@ class TestGetConfigFromGit:
         """A key without a value (no newline) defaults to 'true'."""
         from liblore.node import _get_config_from_git
 
-        mock_result = MagicMock()
-        mock_result.returncode = 0
-        mock_result.stdout = 'lore.autoprobe\x00'
-        with patch('liblore.node.subprocess.run', return_value=mock_result):
+        result = subprocess.CompletedProcess[str](
+            args=['git'],
+            returncode=0,
+            stdout='lore.autoprobe\x00',
+        )
+        with patch('liblore.node.subprocess.run', return_value=result):
             cfg = _get_config_from_git(r'^lore\.')
 
         assert cfg == {'autoprobe': 'true'}
@@ -1621,15 +1628,17 @@ class TestGetSubsectionConfig:
         """Parses keys from [liblore "https://lore.kernel.org"]."""
         from liblore.node import _get_subsection_config
 
-        mock_result = MagicMock()
-        mock_result.returncode = 0
-        mock_result.stdout = (
-            'liblore.https://lore.kernel.org.fallback\nhttps://tor.lore.kernel.org\x00'
-            'liblore.https://lore.kernel.org.fallback\nhttps://sea.lore.kernel.org\x00'
-            'liblore.https://lore.kernel.org.autoprobe\ntrue\x00'
-            'liblore.https://lore.kernel.org.useragentplus\nmyuuid\x00'
+        result = subprocess.CompletedProcess[str](
+            args=['git'],
+            returncode=0,
+            stdout=(
+                'liblore.https://lore.kernel.org.fallback\nhttps://tor.lore.kernel.org\x00'
+                'liblore.https://lore.kernel.org.fallback\nhttps://sea.lore.kernel.org\x00'
+                'liblore.https://lore.kernel.org.autoprobe\ntrue\x00'
+                'liblore.https://lore.kernel.org.useragentplus\nmyuuid\x00'
+            ),
         )
-        with patch('liblore.node.subprocess.run', return_value=mock_result):
+        with patch('liblore.node.subprocess.run', return_value=result):
             cfg = _get_subsection_config(
                 'liblore',
                 'https://lore.kernel.org',
@@ -1649,10 +1658,12 @@ class TestGetSubsectionConfig:
         """Subsection names with dots (URLs) are parsed correctly."""
         from liblore.node import _get_subsection_config
 
-        mock_result = MagicMock()
-        mock_result.returncode = 0
-        mock_result.stdout = 'liblore.https://subspace.kernel.org.fallback\nhttps://mirror.example.com\x00'
-        with patch('liblore.node.subprocess.run', return_value=mock_result):
+        result = subprocess.CompletedProcess[str](
+            args=['git'],
+            returncode=0,
+            stdout='liblore.https://subspace.kernel.org.fallback\nhttps://mirror.example.com\x00',
+        )
+        with patch('liblore.node.subprocess.run', return_value=result):
             cfg = _get_subsection_config(
                 'liblore',
                 'https://subspace.kernel.org',
@@ -1667,10 +1678,12 @@ class TestGetSubsectionConfig:
         """Returns empty dict when no keys match the subsection."""
         from liblore.node import _get_subsection_config
 
-        mock_result = MagicMock()
-        mock_result.returncode = 1
-        mock_result.stdout = ''
-        with patch('liblore.node.subprocess.run', return_value=mock_result):
+        result = subprocess.CompletedProcess[str](
+            args=['git'],
+            returncode=1,
+            stdout='',
+        )
+        with patch('liblore.node.subprocess.run', return_value=result):
             cfg = _get_subsection_config(
                 'liblore',
                 'https://nonexistent.example.com',

-- 
2.53.0


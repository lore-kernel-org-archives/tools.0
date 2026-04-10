Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C423DF01A
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860689; cv=none; b=Eeq0jBjhiHIHE2W5MIU2gSYtR/SlT6fnDCm6js5/IGZ5qp9Dy95LJokT2pU6eAHoykdPq5NxKPkA0DfhTk6sWXvGdxPsKET60GHnZjYXVZNZLzPmu98uI3bNx5CUhEh8cQIdVodAJDKpbqLE9hIR93X2fbe7/2/j59dTZSQZxdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860689; c=relaxed/simple;
	bh=KgTS4QfBnDUyb+OW/vGrYCWXNZpzDvAtowbRRwjn9uc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LexFLdYq3q6VeZb02NhL73Lb761B5zWWkIEhb3awyGYsZ4Dxrcle5SCGSQGc8UtVHjA1fYk0D6rOtMQp0/X61ueSHCbO8WPaHdAe/DeTIUWYWaTWRrQqAG8sW8SMRxLBaBoAa97FAHUW7l0hxN54TVusDgJ3PVoRYnwTP6shpMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pGZRqka5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pGZRqka5"
Received: by smtp.kernel.org (Postfix)
	id C5FCBC2BCB0; Fri, 10 Apr 2026 22:38:09 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CECE3C2BC9E
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:38:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CECE3C2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-50babbce85fso27259951cf.2
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860688; x=1776465488; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C4020ywEe3Pjp2+4HQpidyOK7iIwYsc50M1F9yg+CpA=;
        b=pGZRqka5UbHhyPfl5ag0AIss6CjmsRVjb6sdWaJ+IUAAgdgRC9/wKSAiptmwFSaNft
         jZU0UEMHQnBHMS7bw3zq91s2dkDH5oy51ZoF5rpCKlhvOQQpW0WZOGntdw0l8MSq+GfT
         0+x2weYej4vZ3eP0ZURe7OiUUnWY5RyExiM52E/iTQk5C3gu+MsN055l8apNSyS8tCiL
         I8hYtMljXvJNXxwDJ4Qje9zB/BJGcVrFiB+arSEpoEA04r00kssB/aCZksPBP8Lb7Cr1
         G9uoLjzPZlngTXHsvBKQaTPCCzTz/t1duY+Ck563P4sVUKc7FeWQD2FlO/Q5cDlzU+lM
         dhNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860688; x=1776465488;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4020ywEe3Pjp2+4HQpidyOK7iIwYsc50M1F9yg+CpA=;
        b=bWdS/6m1wBb2GzZZlBFbgKllEmKmiTo1bgqonUFRRf2Ex1vJL4V0tz1YtFvFwA6Nmi
         FVGBYxr3XDQ5yCdCP/tmZwzQWn60SFmJBTLUqqjlbDNwoHcq5Eo5N4AKhXZ96Dm2k1wg
         McGhVZqei/q+Q1LuruZs2BD5yhxZSuKiXdRkqtxI/SRNiz4RWxIGuumFOzJ8iFZU3u3p
         NICMhzjkHaqbKr+0e++Dcb3yIF08510Is67Q0ypmYpIv6LHDBcvK7yqLSwWwRKBgdb5C
         +0C/Q1KHqU2rzi1zQTQ/m4OSSylFvPJhMIDpOJAK4ravegw6BE3W1fHSX4C+5HLPsK5u
         FvKA==
X-Gm-Message-State: AOJu0YwB8KQNB3qpuuHLm+8Pt6UsqdaS5hZeFLX6WnDNt2AqMebXTxCQ
	+toa0HpQvDsDvPyLf/YpJ+0U7Y9fp2XqNo0Uo7rsgs6OAklaHDClD7Pk9rF5inKL
X-Gm-Gg: AeBDievUUYcJkPhfzhZKepijWjNfBlmGMEq+1fWDbZeqsA798tVJAgs6K0pHXtrY4Y+
	9+IfWUtTpDKJTdTdUDPH9hckiTarOBULKgj5BhRqJnCOWQuB1tiIWjYm6FoqZOZUFeycKZKRMMP
	kuepRZ/TgmcEb8PCOYaHrnLXRSYTWz191tE57+oEe28NxZACSjXCTixwphChRmNKv1DQ3/TnL5a
	yIVbBOcF31fB6w+hG2q/LZknMeP0gVAtTLlTzILAvtDcKH8bGjXhk843b9tbxVXdIhqv0w2R5Fr
	sS12JgHIc0Ten++7so+9stYQRoUrA7qZ1Lw3VRHy/6CzarE10fNr5yOnX2eE7H+N3Jt9m+sb2VT
	Rkx3F6egZA7eXHoz1+YPpbtlc9FpDJA7IAFjJzxZ4zny6Jh+qgi09VC12xCHOkt49S9qc3zVYXh
	JaKp0SVYFuVzLGlDM0Csxt27gPebmeYK/zbIOqU+XVSsUHXrQEx7fHxCzQATngptgNtKlXwp4Bw
	hZTauIGKPB6yRDaQhY3DXw8N3luEZL4t5sFgPXcJfBTiTPNfDKZb/FylqyOI1sDrqoa2oYEFxpN
	trMW9aH8eObJvvAa3Zffopk+cxholmF4vIRbCnhWCBjYMrQe6ebp
X-Received: by 2002:a05:622a:53c9:b0:509:2527:d789 with SMTP id d75a77b69052e-50dd5b18f4fmr87148201cf.6.1775860687842;
        Fri, 10 Apr 2026 15:38:07 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:38:07 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 10 Apr 2026 18:38:03 -0400
Subject: [PATCH 12/14] Use CompletedProcess in git config tests
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-harden-type-checking-v1-12-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
In-Reply-To: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860675; l=6277;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=KgTS4QfBnDUyb+OW/vGrYCWXNZpzDvAtowbRRwjn9uc=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QA5PCcHoTH0smeqzbnrX9wMU+gwhg5hWiyL2fznDt8hYRHTkyw2JwvETKSWRI8d6zo3mQK3POuZ
 lb6fcKWM3/Q0=
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


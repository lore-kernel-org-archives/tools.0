Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDAB19DF5B
	for <tools@linux.kernel.org>; Thu, 12 Jun 2025 16:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749745508; cv=none; b=aHnIfzEZXevt/Ex76LsViUOp5DV96f1UqJLUsEvMWcJhW/xnzypeulAoN4ldFzNxtUX+/YFa85Pblp+VjD9Ch7xFfQT4h5nUu86Srx7XzdrEjtisBS4wiGEvmpvWs0c/ST0y3GwgJGmiOhJSR/fnkzvcL0ab1R/ekEPXblA8nIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749745508; c=relaxed/simple;
	bh=UT6x/dB9T+7+OtTK9N9LyGFNT8CTv0GngDyM25q/VKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NFF437Gv5qZuSDxpfEAEuuwT0lhIhm7QV+PjtlhBIJn6WeIiG/+ukJ5mtVxFAYiv+VpqWrEYnRSUcW6lXtmPmXGh5bfb/jmwFUiDeSlb/3SdDnsTGE9hMNZVf1ZW4DihHP1FLG3fglH04RMHZ7/ul7Cqorv8UjgtLqtjrLAUTVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dz2bZ1lQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dz2bZ1lQ"
Received: by smtp.kernel.org (Postfix)
	id 042DCC4CEF1; Thu, 12 Jun 2025 16:25:08 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1328FC4CEEA
	for <tools@kernel.org>; Thu, 12 Jun 2025 16:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1328FC4CEEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5f720c717so232880185a.0
        for <tools@kernel.org>; Thu, 12 Jun 2025 09:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749745506; x=1750350306; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fRDL3+ZUMiYn1VOt6Hi3Q6HC7xpufC0NH66mVCd8GKk=;
        b=dz2bZ1lQAGnqUDmBgvIbeZ3zVWlnPF3kn38NRj/ygWMbg5j315g9l7ftp49WzNTmNG
         /UBlC10HZIB5bvk8O9qHS/VDA+wxmKq1g7TzwmveUUzpDlrAh2zkXKG3OAJNLaOYXJua
         bHZaPN2Dcsymah7BdbdV14BkXwldz8ls/XIirlaEGL5thfkOjA3Zhmz/KdsZguYo+ak0
         Br17vE+DSeRk7XDIxomwE8fKWToKIhL8EJOpiTbw4IMdYHCPd0MFGROYp+rC4LJs+fY0
         YB0F6psiTpwp6NkT2YsNf3Qvk39/inPQIjRhOJD99B6SRMiFgF47ywWaGI1a/kBr0jHp
         hfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749745506; x=1750350306;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRDL3+ZUMiYn1VOt6Hi3Q6HC7xpufC0NH66mVCd8GKk=;
        b=V/EtwZBEL2LRq2PsEZMKa/8l/riMSH9wGFJgJP/PiT8omo1Tjb+SruPASt28yA1KaJ
         myXYZkg/AcBY6HacBPt1KBnfRkRLUo8Us6x27QkA1lLPFgcaE06bRuUT9eZDjyqVS8HP
         svKvT9iofWwFND0VUi2OD2ly99IB/mRL9xcttLMU/TQJIbCvYwcxjocO1CPhWhB4lo5G
         lA/E993Ll6a81691CZ3lCc14FcNuI/OlrjcYk73H4dli9xriROD1QwgHtEHG0BGdfEuO
         GTYq1f5kd8b00G2eOBi+zFB96caEcftyzLVi3gchSTIKSw7f5K38lEELCsMCoyfq5fkz
         +ujg==
X-Gm-Message-State: AOJu0Yymj30HVT7qc5qM+b5/V5bp3XgpEY+xGzxlAIrZKH8MkdMTWmOq
	BFgzp9/kGZuDJQlsmvBGcB3XyurPBr7LgW7wHz/Kq05GH9Hv7gS5Y6ohaGEcsA==
X-Gm-Gg: ASbGncvTNNkC75duT0JoF4UYFUcQ9V7tsxxJrUEpP9AS0ApMrkg1swutLdP1uSUzUld
	sAiemrOJ+4G8pn2KHvXsCS02VFuPOKcaxuLH/A7DFBoJyJbQ34E3B41P3NJ5Ekff1LeDzHGsDH4
	Uwe+QJbbFUPa2NlVcJES++zeLaTZUosoA2hpgqcbHK1AnN6BuviKFKDhiY4w74qZsazlelRAjJ1
	+iUVjDu65nVYVTDByyTDtXkArP0EnhOAQAsCce9FTKOSkE8QgTtTti5mccSRJ2B+ZVeM6C9uCY8
	Z0usTjRbof5VZXdfQnsRYfby2nCkfUxdWDP9oNAICz5rkc4g2zKIRqP0rlDwNFCtK8w=
X-Google-Smtp-Source: AGHT+IFzGtacZzTGysrqcUsdVMlF/IRV5lT/bxhi1xVOe3US1TOMLeVNHJO/u/l2fp0PimgNO3rgLg==
X-Received: by 2002:a05:6214:c49:b0:6fa:a65a:224d with SMTP id 6a1803df08f44-6fb3478d99cmr61248406d6.4.1749745505632;
        Thu, 12 Jun 2025 09:25:05 -0700 (PDT)
Received: from 1.0.0.127.in-addr.arpa ([204.93.149.233])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b20f72sm11996486d6.23.2025.06.12.09.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 09:25:05 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 12 Jun 2025 12:25:01 -0400
Subject: [PATCH 1/4] Improve SSH signing failure message
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-better-errors-v1-1-3aa1523f6d8e@gmail.com>
References: <20250612-better-errors-v1-0-3aa1523f6d8e@gmail.com>
In-Reply-To: <20250612-better-errors-v1-0-3aa1523f6d8e@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.15-dev

Add a base class with a proper `__str__` implementation so that stderr
from ssh-keygen is included in the output.

Before:
  % uv run b4 send -o tmp
  Converted the branch to 1 messages
  Will write out messages into tmp
  CRITICAL: Failure trying to patatt-sign: Running ssh-keygen failed

After:
  % uv run b4 send -o tmp
  Converted the branch to 1 messages
  Will write out messages into tmp
  CRITICAL: Failure trying to patatt-sign: Running ssh-keygen failed: (1Password: stream did not contain valid UTF-8)

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 src/patatt/__init__.py | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/src/patatt/__init__.py b/src/patatt/__init__.py
index 4200ce0..7785248 100644
--- a/src/patatt/__init__.py
+++ b/src/patatt/__init__.py
@@ -59,34 +59,36 @@ CONFIGCACHE: Dict[str, GitConfigType] = dict()
 __VERSION__ = '0.7.0-dev'
 MAX_SUPPORTED_FORMAT_VERSION = 1
 
-
-class SigningError(Exception):
+class Error(Exception):
     def __init__(self, message: str, errors: Optional[List[str]] = None):
         super().__init__(message)
         self.errors = errors
 
+    def __str__(self) -> str:
+        s = super().__str__()
+        if self.errors:
+            s = '%s: (%s)' % (s, ', '.join(self.errors))
+        return s
 
-class ConfigurationError(Exception):
-    def __init__(self, message: str, errors: Optional[List[str]] = None):
-        super().__init__(message)
-        self.errors = errors
 
+class SigningError(Error):
+    ...
 
-class ValidationError(Exception):
-    def __init__(self, message: str, errors: Optional[List[str]] = None):
-        super().__init__(message)
-        self.errors = errors
+
+class ConfigurationError(Error):
+    ...
+
+
+class ValidationError(Error):
+    ...
 
 
 class NoKeyError(ValidationError):
-    def __init__(self, message: str, errors: Optional[List[str]] = None):
-        super().__init__(message)
-        self.errors = errors
+    ...
 
 
 class BodyValidationError(ValidationError):
-    def __init__(self, message: str, errors: Optional[List[str]] = None):
-        super().__init__(message, errors)
+    ...
 
 
 class DevsigHeader:
@@ -370,7 +372,7 @@ class DevsigHeader:
         sshkargs = ['-Y', 'sign', '-n', 'patatt', '-f', keypath]
         ecode, out, err = sshk_run_command(sshkargs, payload)
         if ecode > 0:
-            raise SigningError('Running ssh-keygen failed', errors=err.decode().split('\n'))
+            raise SigningError('Running ssh-keygen failed', errors=err.decode().strip().split('\n'))
         # Remove the header/footer
         sigdata = b''
         for bline in out.split(b'\n'):

-- 
2.49.0


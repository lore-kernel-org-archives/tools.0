Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE767283FD9
	for <tools@linux.kernel.org>; Sat, 25 Apr 2026 19:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146604; cv=none; b=lEChvsyw6OoRRWrmV3dq7pkL1+5gKhJVnQrm2wQWnMk7cQHw5Yrfrh1SdiiK2/9SZv8TwoZaqNA97DzdDsiaw62h9vejcUCDcJIJ8sHmqB9sqdp+LfXGvXNEyYO3qqAh4WMWZcWbz0gzts3Ea6UVzFVp+iMPzi2qMj0sjCwXOhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146604; c=relaxed/simple;
	bh=tAGpJKhn0nMzYj9QhqSLAWpiH395wuAaBMN6imXPgTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ov0VGFdu9IBQfCWEmQ+h2sxLdmg68/oRkx93hijiLi7P0FhaTJJbdAMGXJBleNC4QoKSsoik1Ty+HfDX9xa+gPnJGoUids/auNQ7ehqfGbmqAbN+TUQfZUunBHNCykXcZhPF4315RJLn47guPqGblkZV0/6m3Vl8wlF2CxS5Ng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=luFy+4yc; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="luFy+4yc"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c750eaf4cso548030c88.0
        for <tools@linux.kernel.org>; Sat, 25 Apr 2026 12:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777146602; x=1777751402; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1oxWOBhdHvijkhDg0CnJqHaDuysPe3RVV4VytiZJU0=;
        b=luFy+4ycbn4KyITbMXGT0qIC81s2oZ+WbtrU+S5q97TxCTd19ozxMu+DEn5Jhi+Pr9
         JvD096KxqV7OQAmAsikp2VNIt9XjnGYmTEIDTj0ewjP/7CWH2A5QRdMPnYLc9PsK3N+D
         IwLsLRymTMZnaKveDGZPxU5M7+j8QOSpqsnb4YfnZlzjVra7vy/XcIf4t/xvYvoygZk/
         gjmlh4fxfpOTeu44aZF4alnw/11dC/+sRi6yr4FhaFTcrm/5t8hyoy2559ePS3B8p8Rw
         3EB5pMMGUPWzfdrd4WnZ1wEv9JGVrOVqd7/WC8EGrLelbPn4W+KZHAxlGzVgY91ux4Vw
         KG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146602; x=1777751402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q1oxWOBhdHvijkhDg0CnJqHaDuysPe3RVV4VytiZJU0=;
        b=Xpm1hQXLoGQEroyHlRarNidIucYZ70AQhPwE44kiwP90rctQA86teL4Nqum04dB3te
         aOePTiclhCqm8Yog5+tX16VhYihKmWjgbWDPkDBysgb9uvtJPIRfEm51udQNxnQi3EDy
         nS6a4PlgARmNxWeeE4T1gl9CquSiV5rcLMVVRm4xZyCNfaPhs+mYhkz4dxn2G+B0DVdQ
         LISb1a/2Q6f8bNJFYaZ1kdrBW4ixPaq3BMu+mcAZCvrJtp+gKikuyKwMIb7edyIcyLSE
         QcnNreUwz8KXZcsyj5e5Nv8cA2yPB0DmzN8nGacp89fiKQcqTwSTfsG/gfOyRTvd8B1Y
         U21A==
X-Gm-Message-State: AOJu0YzWAjIEtrzJrgPb8UN6RkjGTO/6YJiKJym8XWEzUeT3tqR62iy9
	JYbdqZejnLXdGWUrRYjZ0uWaPmhlzV1jdYetDQCrsZlzK4V7taznT3ZZ4+pPqA==
X-Gm-Gg: AeBDiesSgrDmtOTcIR4QvagX61vPvv/mbsFHOk28jAhTDGi6fLdnHmPHA33wsollGN+
	FWsiesjO8VF8oJ0Ehv3YPHJS2Us/iE+1q/bQz8yZiic8Z6v01PgOkPEWOoDXniigf1ZctGqXWWG
	XnFCNYgmHoyY2CXwwFEE4tH1/F1RpN9U0Jecj8r7BZpPhpGQ6afcU44jJyoTsCL7sOprRf79ev3
	z4Yg5KsxTe+oDmnTEHOx0U4+YKoxM6WC2swXbA7ao8+FuWxjfGKpx3pI8wYNLkiOnW9GxVahgj8
	mXw3paoL8BRC+9xyzlX7LJpDKC7rkMPN9IWGpjMXuZYa24UX97zrLHWngjLYwTV9OXEpOafc9qZ
	DlM2ukbHHmkQvmB3UEhTIu6lS8KiziW1NZ1xnae4r/es9qr5e4bN021VgI/V2kECO8GStfaNhvz
	3YHH3I1Y8Wim5gte3u6MkgFzyV1Yysnqt/OOAnved868SLvR9ttOzPs3zkTEYoRZKcJCUmanlpR
	Otvl2ZMcQPI42D01g3pgtWx
X-Received: by 2002:a05:7022:f8c:b0:12d:c6d9:5faa with SMTP id a92af1059eb24-12dc6d96099mr1493786c88.4.1777146601809;
        Sat, 25 Apr 2026 12:50:01 -0700 (PDT)
Received: from localhost.localdomain (187.250.115.107.dsl.dyn.telnor.net. [187.250.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm48512078c88.14.2026.04.25.12.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:01 -0700 (PDT)
From: Adrian Neftali Sanchez <lutgaru@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org,
	Adrian Neftali Sanchez <lutgaru@gmail.com>
Subject: [RFC PATCH 04/13] b4: resolve platform-native data and cache directories
Date: Sat, 25 Apr 2026 12:49:32 -0700
Message-ID: <20260425194943.1499-5-lutgaru@gmail.com>
X-Mailer: git-send-email 2.45.0.windows.1
In-Reply-To: <20260425194943.1499-1-lutgaru@gmail.com>
References: <20260425194943.1499-1-lutgaru@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

XDG_DATA_HOME and XDG_CACHE_HOME are honoured when set, covering custom
Linux/macOS setups.  Add a Windows branch that reads APPDATA (for data)
and LOCALAPPDATA (for cache) before falling back to the
pathlib.Path.home() equivalents, matching the Windows platform
convention.

Signed-off-by: Adrian Neftali Sanchez <lutgaru@gmail.com>
---
 src/b4/__init__.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index e878d34..bddf2db 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3896,6 +3896,8 @@ def get_main_config() -> ConfigDictT:
 def get_data_dir(appname: str = 'b4') -> str:
     if 'XDG_DATA_HOME' in os.environ:
         datahome = os.environ['XDG_DATA_HOME']
+    elif sys.platform == 'win32':
+        datahome = os.environ.get('APPDATA', str(pathlib.Path.home() / 'AppData' / 'Roaming'))
     else:
         datahome = os.path.join(str(pathlib.Path.home()), '.local', 'share')
     datadir = os.path.join(datahome, appname)
@@ -3907,6 +3909,8 @@ def get_cache_dir(appname: str = 'b4') -> str:
     global _CACHE_CLEANED
     if 'XDG_CACHE_HOME' in os.environ:
         cachehome = os.environ['XDG_CACHE_HOME']
+    elif sys.platform == 'win32':
+        cachehome = os.environ.get('LOCALAPPDATA', str(pathlib.Path.home() / 'AppData' / 'Local'))
     else:
         cachehome = os.path.join(str(pathlib.Path.home()), '.cache')
     cachedir = os.path.join(cachehome, appname)
-- 
2.45.0.windows.1


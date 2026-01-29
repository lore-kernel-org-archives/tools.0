Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998DF379990
	for <tools@linux.kernel.org>; Thu, 29 Jan 2026 10:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681259; cv=none; b=YnEnm7m1khVfd+yEABFXK47VRm5bq232+lh3XiQoHpkaaUwHS/83mrLTSmI9mIBuijnQA/DFTjFbl6lx0LDWgfOKcVJN+ui3ThWw94TkdOSnT6p3WP6QiRv+tt+/LXr2T1LFkpMVCYMJDBDc44P926fc8RTrR71I6oehE3GWyEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681259; c=relaxed/simple;
	bh=wu9M+YDfwJ8dOu+FlgbV64HrctEi6RsMM0HvZsHXUeY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jCxn3NSQrPIcR7P4XyYfq6WmwqiHDh9nz+Snoqzk4CxNoBUkdGN8pE5abD1pc6qkOVmvJl0rhkyPPuJ6mBhBVVTGtnwDdBsst7UIibmZiiXL1+MZdq07HveK8wO0s0RydJeLlJZfg+kNwqZZYHnSVkqoDu/Y/cty9YqH9WbzYxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SyAgZ00c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SyAgZ00c"
Received: by smtp.kernel.org (Postfix)
	id 53817C116D0; Thu, 29 Jan 2026 10:07:39 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E5892C4CEF7
	for <tools@kernel.org>; Thu, 29 Jan 2026 10:07:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E5892C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fed090e5fso680399f8f.1
        for <tools@kernel.org>; Thu, 29 Jan 2026 02:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1769681255; x=1770286055; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SXjsCpfPue0aejTaneGRUBU74TJUzAkFZKgHEp8NI+s=;
        b=SyAgZ00c22rAQtweEGMfh1iQdimFUIBoJDYGH7q4SA49ypvPa8+xGmofQAQ2RA/qQW
         C8ecNFMbc1UtvCGyrEplCNoaySQaBBOvqOuEgpCuFfYTR1Huu64h8bZ3f5nrE1I/li1g
         WUQRtG9efNt5IBZjuim9v4Q882YEAYzega2VQCbbES+SyyBfwJSSGKluOPGCF0p++M3O
         oYnD9FzBcqeodniH5BUL3Q1/GWydZSpOfL/2vA+9mMPTkWsa5qRgwTmXCPz32ylza+Bm
         hH02Bjip2tvxC3xrdRN7cLMPJB001U5O/m9nG5D4Sxq6nqGMa4+MHZYWZ5JhZlK+oK+x
         fL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681255; x=1770286055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SXjsCpfPue0aejTaneGRUBU74TJUzAkFZKgHEp8NI+s=;
        b=bZFACg+PFvXp1iOK5ntMgXmmKezLq9ksyfmqpSHbh0RtDhJsmABnR7Ha+qe0OZnMyF
         oRxHJcl+e53Sx14IWa5wVBkrv3tRVEIQ7pb4TdV8Wm/YEribiPer6piPCKm3NObgpZN1
         OPJvNA9ci1Y7CIJzA6DG2AKYofjRr9rDbI2oKl0omSlVs+3+IwtPKF0/rUZcq4cXd9N3
         vWoxOELIANY6jH6/y7wQJeDg8HngxasNLPqTj14ZuCwIjcu0Cr/+pOilSqLNeZs8SkeT
         F3spuUGlhpCmYXefqYRwQ1udfAX4YVzoSSBnvTnRMNdcIXafGCt2YspL+YesRdCtOfWR
         105w==
X-Gm-Message-State: AOJu0Ywawu/sjV8bA/dlvuyLnPiNjYeIs8jp/JqU96knlYVTEV9VreAJ
	R0avy1NZ9eEt84Cm+/HfMS0tgNG/DJxBZyMfv/ZQ8TwD212Ys0BGO/X0OWo82I867vZ2HhcJj+2
	CFjZs
X-Gm-Gg: AZuq6aIOvauSGrXWxt1EWi7+XJRY0KJI7Mp9N20pPyspRzNFh94MpJPlqz9AW9AoV8G
	8HYu9yQG5MQVJcwbdBhCQO4BWC022gXKuW+BiSiBQCt7e4l5PpDsPb23PnfBthZAKCwjxOORS7A
	Bm3wWHY3MXyTFwoUmaE5pmf874JTlxELnm980KAtYnbt77SvyLzDqGKElv6qD79kIj4BqRsHgAn
	T0TRI4X35+/PhbUcLg/8w2KnsUMOsWCbl4ga5fLEBc9YIeQ36/4utqe1kGsgusrWQOpOxWE4i3v
	Wt30YJ1h1jcbEsBXvQxOGS0ixyYJoNbdFYPtgzoSniJqZCJXjbE3r3j3XxyNSPa+KGSZVAqoODX
	u69fx+bYabkPPY/yhIfutZBsg9guYRaWMeuxyjOnaFvowEKJWhrpy+2rH/cjZtyrd7K3OiRv2C1
	7V4Uu+emq+ZM+YjkUnZG69/nlU9DpRMj6m2P9I4DfVSrr2PDd6YlzcRpKRpvrlq95QTaHzp8XDb
	yk=
X-Received: by 2002:a05:6000:1786:b0:435:975d:33b0 with SMTP id ffacd0b85a97d-435dd0a39dfmr12242170f8f.35.1769681255161;
        Thu, 29 Jan 2026 02:07:35 -0800 (PST)
Received: from localhost (p200300f65f20eb04703f3ea9880728e0.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:703f:3ea9:8807:28e0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-435e10ee040sm13325632f8f.11.2026.01.29.02.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 02:07:34 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: tools@kernel.org
Subject: [PATCH wotmate] gpg_run_command: Set output charset to utf-8
Date: Thu, 29 Jan 2026 11:07:22 +0100
Message-ID: <20260129100727.950475-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1600; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=wu9M+YDfwJ8dOu+FlgbV64HrctEi6RsMM0HvZsHXUeY=; b=kA0DAAoBj4D7WH0S/k4ByyZiAGl7MV+hqNmZ7jb2bMW4ynfWJ0pO3vqpF7Y59dwaVG7hmSXVJ YkBMwQAAQoAHRYhBD+BrGk6eh5Zia3+04+A+1h9Ev5OBQJpezFfAAoJEI+A+1h9Ev5OirsH/3KX xXvB9tCqEfr30LirAxcQuBxAFkGQPqd31Tzy/xWPIOdzHDDlTjYm4gckf//6GUZA3NILzInw1bt c2dHrITwQX6eoS4ceKZuz4GIw9CP2m+iGU2b+OwVHSxDRJ34Iob05w1HKev9LNy1ZMmKHTKSgEo 8VIkZCXz5hLuugdYhVgoRHG3y17Zh6Qn7N/PZ8PyqUs5J0OKdKpQFankW4s8YBhxrCO2Y8e8TnD aQz7mu0rr1KM3TOqzgSEDgCrR1nK/+JKPE2pdjTcJX6Vpvfx+E8aWeir4u0BRVJacEqVOO8ITLk LWq5LrYQNGJhKRfa5pGZ94FWED7H04qXVjd+ZPQ=
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It's 2026 and still the certificate info in the kernel pgpkeys repo is
encoded in latin1. This happens as the call to gpg happens with an
(nearly) empty environment that doesn't contain locale information and
GnuPG defaults to latin1 (aka iso8859-1) in this case.

This creates difficulties to send patches to these files by mail as
these are usually transported in UTF-8 and patatt only supports UTF-8
files.

So instruct gpg to output the data in UTF-8.

Note that the graph files (both txt and svg) already use UTF-8.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

if this patch is accepted, I suggest to regenerate all the headers in
the pgpkeys repo in a single commit to not have different encodings for
different files in the keys/ directory.

Tell me if you want a PR for that as regenerating just the headers
requires some changes wotmate.

Best regards
Uwe

 wotmate/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/wotmate/__init__.py b/wotmate/__init__.py
index c88a209e1d59..e4b9d8d24cb5 100644
--- a/wotmate/__init__.py
+++ b/wotmate/__init__.py
@@ -63,7 +63,7 @@ def get_logger(quiet: bool = False, verbose: bool = False) -> logging.Logger:
 
 
 def gpg_run_command(args: List[str], with_colons: bool = True, stdin: Optional[bytes] = None) -> bytes:
-    cmdargs = [GPGBIN, '--batch']
+    cmdargs = [GPGBIN, '--batch', '--display-charset', 'utf-8']
     if with_colons:
         cmdargs += ['--with-colons']
 

base-commit: 7d1694f954fe486332c3eac65b675a7c350ed7a6
-- 
2.47.3


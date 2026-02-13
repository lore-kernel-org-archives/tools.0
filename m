Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821A024A07C
	for <tools@linux.kernel.org>; Fri, 13 Feb 2026 17:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771002275; cv=none; b=m7LnZVdgXnfmLx8+yBeVKHMPTZLChhUcadWEbBobWXcccQDO71qlns4IJeCxmtqg1JZZYvX0SY63GbnJMqhG1pE5XiT8u2H3bs4SFbIBEjmA1bBcBOQlZyO87lOZ6fwKUwvsDmYdKx5tK6FUY1emRZFbFOsN46fNcynEPEaEEVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771002275; c=relaxed/simple;
	bh=IdyM8LZgyD+oW/QjdrtqNEuaNe82/6xx6Kz/7G9uHII=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rOCbVdWgwM1G49YDYta8joY5AH57+nX9TqH9j116sDKSer6xLMuqUSrLsYox2K/t1m8AzfalbEu/0vh7FqsnDc7huDyc1jfTsSpJpCiz17mC5MQ9ThnK698QoCVZSl5GZRcORTDNWLDZhp16EJcfrJZYbk4hwc+qOMYg+rflNW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=0eaAvHzG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="0eaAvHzG"
Received: by smtp.kernel.org (Postfix)
	id 34FF8C19421; Fri, 13 Feb 2026 17:04:35 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9E13C116C6
	for <tools@kernel.org>; Fri, 13 Feb 2026 17:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9E13C116C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso9787285e9.3
        for <tools@kernel.org>; Fri, 13 Feb 2026 09:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771002271; x=1771607071; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5D26eInTPlrWYOHSse7eY2veRFhp7iUp9NeqozxQ6LI=;
        b=0eaAvHzGIN/uh3+brUtMNQDciUmFJtsTnmHMAYM4lNHBkf+TF1eaHpj++Cm0jfnYCz
         T18R7Gq95K1LwqYF0ELW765rWrOEzs0JghLBQZ4hxzH09unItqNBhZIsVR3DXlKS2Y3A
         hU/Suk3/x5+HjMJU0JqESruafgAjr11CbwJc9AcCS9VAvSJ99DoM2fFd/Tks34+/k7JS
         wmreCKxgHPD+WX09k+8EARLf/w7r6T7kJnpa50LwJ6ifL2z0sTDicX6hkEMOL8pSzvG0
         OTGHa39xfFa5zuEAYYLxDAkT3QOnKx0bfBCFuWf37Zi72p99S4XsVJjx5337332ilqSy
         OFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771002271; x=1771607071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5D26eInTPlrWYOHSse7eY2veRFhp7iUp9NeqozxQ6LI=;
        b=lnAEyv4a2ZBh9bDuepHkA1CG8jUkWnoYhUQpVF5DZVgYrb437Uj0tz2V7AzbZbMxVU
         sifQ7nUGMzWS+VONI8Lf2bEr0lb4VT4wW01OKXQSQpEkzhrTMR68xyNv9oek8jDWQRK5
         IDMyBuzLz9UppW9ibmlpe9cM2eh0Ez9E5U6EIMozdEYfJgRi2UY9HOFQn3m5shyNJRws
         +yEXu0QnDtXdVOBSQhQZInKrjJ47Az9fyVgng/dVAj5sEs1oyfRipUq+3xo8+vXGksE0
         8wvkYytUBHrKmVu89O1u4a2MhPPxx8hbTEna9cdXhToBZNawY379HMavleVzqSj/5wE2
         bJAg==
X-Gm-Message-State: AOJu0Yxy6OmrzI0k/SgxrUbjba1VdxR4GzgwraKh2sMrPZDnnWlxwI4b
	CdCoEltItPSbYxGcOBc3EJjmWFFzwvCIXCfDHTLYAfAi1Q5HnB5kDRPXJG9H5dp4UO2rV6V0kiX
	K0Vtg
X-Gm-Gg: AZuq6aJ6vT/PQewqVopAKZNID7Nx+fJMNRhhCYBnb+cSyudVfZ62ik0K4xlsg/kDzOX
	yP1lcM6K8LXDKMDuyG/lVvBpF2ZDjuxsnWCVVH25GKgb7kpjbOEeImOGT81t1tCnKRCQELBollB
	invGixe8j0PqPVPrQIrO2PeQ4Sn7IS3A1JWUTW2SY80J2+uhtc2HdQkyTBjheemmJMU2roXC4vm
	z+74k8m81Zmfxms0cAuCEzUQyyAinAC+bwifj7u1Z2DkbHo8wFPCxVIcBLdL+Egm6Ua4jh5wK+A
	qFVNzmAD/TUwk8TBMQw/BxxYsJLlnKBU/9A2T+CXNjfmiqONmbxISWs8uCS2B1ItIVwbem/kRBx
	B05GE0F8CgbynJilOMCoEy0SnpMUEa5wOOCHOke+Hiq3kkR4a0P6AHkV3F3DAqWDaSJ5Ge0CPBU
	Xx231T8Znl59SRc3QJwB9oy9YE3gxUvQ6ZsAyVXdNoeLgf0cUQ79o5OegOcXoMottq1DVbST4Qg
	sPS/0I7Tm+3NA==
X-Received: by 2002:a05:600c:4e86:b0:47d:8479:78d5 with SMTP id 5b1f17b1804b1-48373a16077mr44097485e9.7.1771002271016;
        Fri, 13 Feb 2026 09:04:31 -0800 (PST)
Received: from localhost (p200300f65f20eb040f063ace48d98e4a.dip0.t-ipconnect.de. [2003:f6:5f20:eb04:f06:3ace:48d9:8e4a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48370ac3564sm59564665e9.5.2026.02.13.09.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 09:04:30 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: tools@kernel.org
Subject: [PATCH patatt] contributor-guide: Be more explicit than "Very recent versions of git"
Date: Fri, 13 Feb 2026 18:04:19 +0100
Message-ID: <20260213170418.4138575-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1275; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=IdyM8LZgyD+oW/QjdrtqNEuaNe82/6xx6Kz/7G9uHII=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpj1mSJ0HWkpUwbjePelMZ5HyAeQQ72gMb67pv/ Q6KNijQW+yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaY9ZkgAKCRCPgPtYfRL+ TkWqB/9xTfnfD+c2YyJBJd4zefeDq69CAjEdEk2gpUSN2dSuIf6ocuG0530DM5gvM+yKMcI8ZLp fwLvCEjDQcIrFQXA26Vn89S2U4UKjP57+khpKEjuWMahSVcKUuWpWaxMsfjWBtAFrpnTQio1vKp 1Y+C94MVALVzVP6IlREkVJsSOX2ANQkyHjwgkiLGA3PITNS1xbd8nuSpDCzxwmC9kn/M+w2PLdX Rgc9nRAe49jdFOil/W1RTnEYmQTq+abjmXoNdkg5h9u0OJGCFwAmRpmdIMSyhHSyRp/aA996kmx yOBpK0YAWuZ/N9a2+CD650CjzCRVbh2c8K4MptbVapq9pPre
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

It was in 2021 (see commit 90b28bed4caf ("Add support for openssh
signatures")) when Konstantin claimed that you'd need a very recent
version of git to do openssh signatures. Now more than four years later
this isn't shiny new any more. So replace the fuzzy version hint with an
explicit version number that makes it easier for users to decide if
their git is capable of ssh signatures.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Even Debian oldstable is recent enough!

 docs/contributor-guide.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/docs/contributor-guide.rst b/docs/contributor-guide.rst
index 247a04e0f96c..6728734de797 100644
--- a/docs/contributor-guide.rst
+++ b/docs/contributor-guide.rst
@@ -151,8 +151,7 @@ Reasons to choose OpenSSH keys
   passphrase caching
 - You can use ssh keys with u2f hardware tokens for additional
   protection of your private key data
-- Very recent versions of git can also use ssh keys to sign tags and
-  commits
+- Since version 2.34 git can also use ssh keys to sign tags and commits
 
 Reasons to choose a standalone ed25519 key
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

base-commit: 3b9f6ecec8e17225b66483ffd0aecb8ba1c328f5
-- 
2.47.3


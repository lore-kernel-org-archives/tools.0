Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D971C75E2
	for <tools@linux.kernel.org>; Fri, 28 Feb 2025 07:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740727287; cv=none; b=WV/OzIApv5lpj5WVYTJiqjqRIPKU17C6vJGFV4o71gtVf7rjNQDOCOzz4ZNqaBpizkbO+IbQL6odP/Pgzri9eZ0+zid516rYWDQomX9A/N+DmJv8p+X058POvMcgMWxBT9hSyVsmA+9yNDamyk+dBpaqa2k31OZC6PbzU5sndNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740727287; c=relaxed/simple;
	bh=nj6OKxgDNUyxH1L6ms1onYXbDS9HwcsT4YUpNFNmclw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KYP8UCjQ9HlSEZrisWI4HSdUhabHimNqq/7JjWaiIiLYF3Ofbn4pjzPKtmRe1iJiI6uZgjoIwtfQZtHqknJtZpcP2VQd4r+OwtBdssy+bLsqfI6iiPO7YNQOGwzOaTjSkT4x0gZ+jOsokR28Tptk7Ua26z+Ix6g4uyQ0aEVobTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=EhYhs3EB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="EhYhs3EB"
Received: by smtp.kernel.org (Postfix)
	id 12B51C4CED6; Fri, 28 Feb 2025 07:21:27 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4402C4CEE4
	for <tools@kernel.org>; Fri, 28 Feb 2025 07:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C4402C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so16987685e9.1
        for <tools@kernel.org>; Thu, 27 Feb 2025 23:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740727284; x=1741332084; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdMRMeVmwVI8uRGGoWeQPRfV+2NOBDXQJtJja6CeqMw=;
        b=EhYhs3EBqD16vALbjApcfYULtqfug7jNGGqhs7JNxQcLWV8AsXeRF9VFFxp0nCAv5c
         wEEeYxaxF3KOaR2dCH3MtURgOCpu/yba6J4RJ/CIsz/K0wmg1iOHn/iePC5eXfP/F/Ze
         h3adPQH/j6QlH/FsVraZA1PiDC6w2K1ZGis0S9VOTQv8OjRGw/tllxzy7dScbvELwp+w
         lothj2HSinBU5bthQYGEO2f7AzY70L1atqJqeDZdxsgA6aT6DE/xQ0RPb6liFkW3EZSk
         vgnFe3iA5gnzQyrprD8S8CCTfqFIVclPnf9sWeZUpr5yq3IfB1pZLN3Pj+wusn5i9Pzu
         RdyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740727284; x=1741332084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdMRMeVmwVI8uRGGoWeQPRfV+2NOBDXQJtJja6CeqMw=;
        b=sQEagZt0IW71hUhJoM0e5b0SBD9dig+NAoAEFiMNLCVXJo6xn+zzVqPQYKOWtZimQ3
         zzCN6+tpB006qvArlRl0C8KrXHf1hY1s1YYQ98FEGLBoXd7w+wRyNiymTMeBblHla21/
         wi1Z1P4m4avtc0EfsAB/WoDhgpuZ4gNhK2sQFNzx+SO0vB2lAqNOlA0gzJtbG7Z8kbF7
         0/FKLWihiSZzc03OLbrHsoxVfZXveXRXE7vfY+TeDV4qz/yUslzvltn0LCATe4ZvwP5O
         IRBIB6eI8KFoLpsELWcOrsOcB2UjkBJwY588DGxUSslmKU9D49lu2REIagdMq30a+9Vr
         SC9A==
X-Gm-Message-State: AOJu0YyTgXGvqkaI90u+O0VolcVL1U/9jod0D23GvuOsgqL25fkz1riT
	pvXc+jl+FHzZ5qz+xCH+5eRVLYkS4Fs2ruco5EzBEmnDrJCco4OvaY2uWI+SSksbtvivH3g7PV0
	/
X-Gm-Gg: ASbGncsWfLoCozjIVuQb+GiK6Nc7wyWdq62hyg6VxKLtkhYdNr9xhqZG2edEVfLSKKi
	c3Q2QeWO2mVFgGefKymE+Wf22kxZvW1Qx35j/qQKpl4uUJChF3lVmDdZWvDwD95sfP5kNqkZ/t9
	q6gNfmVMJvujfM4eD3KT3Gm9M4krwt6mVa/bhyYtm9MrMQtRZvBHxqY7gRRVuqF3yDBSScPTEXn
	FR+uJxScViYDipeCBxOw9+riTcXMeCPoWflI5T0ojcDTIgxXeS5sDhs43KE/cyiiU6W72Ooyl3v
	ZYwy3LFWUEVSn4DAh2A+KqvB1nkjcfz/4QBLnKkphExJLX8UDtRENdwuWh5cBk65
X-Google-Smtp-Source: AGHT+IEnoO3F7uh294hfbScBjxNuBggPv31HOOS0qz1Qkya0aaZKiaZzaejE/QhGw+HYRgEkNyzIpg==
X-Received: by 2002:a05:600c:4693:b0:439:a1f2:50a3 with SMTP id 5b1f17b1804b1-43ba66dfd93mr15461625e9.4.1740727284051;
        Thu, 27 Feb 2025 23:21:24 -0800 (PST)
Received: from localhost (p200300f65f2c000400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f2c:4::1b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b736f8034sm49340765e9.4.2025.02.27.23.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 23:21:22 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH pgpkeys 2/3] korg-{refresh,update}-pgpkeys: Use /usr/bin/gpg as default path for gpg
Date: Fri, 28 Feb 2025 08:21:05 +0100
Message-ID: <01ed2aca99025af19473cfce1b6e54f312ed831a.1740726978.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1740726978.git.u.kleine-koenig@baylibre.com>
References: <cover.1740726978.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1228; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=nj6OKxgDNUyxH1L6ms1onYXbDS9HwcsT4YUpNFNmclw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnwWPksFFlJ7xIvr8Gpk9QMuRWyf/xfuYKtqPRb xiKTGh+dKOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ8Fj5AAKCRCPgPtYfRL+ TvRNB/0eLJ3Qdo9ngdi72JVNAPtDjbziMlI1ZgDot1TkGMHxDVFpPvh7v/PEKgOplSWl0n+PBei HLitvZIbQRHrMoJkyQ4KOdOe8KP/Mw6j4N27hurHG4wQNwrSObL+KI5YmoSsSTJ+AuDdceiXtnL r/FZlwrKrIzWIqOyRTuznDZ79jXdJerMlgmjmmvQw1rAYVH2ZacesqMWcdvD2iW+/qL5buqpNCu eMlWpSMQFFCyPlY0G2tJrnpwLdEYP0AiBHnhOIYO4IE4RfNhU55jnWy3vCtasXLY5ecLbeFoPBR NSjwawR8hRkeNbiNGjBl2l0cSH3UcNEt0Tq1/u1AqEnAPjYP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The scripts in wotmate.git use gpg and not gpg2, too. Also on my system
there is no gpg2.
---
 scripts/korg-refresh-keys   | 2 +-
 scripts/korg-update-pgpkeys | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/korg-refresh-keys b/scripts/korg-refresh-keys
index d66b489341b0..cde93620b10d 100755
--- a/scripts/korg-refresh-keys
+++ b/scripts/korg-refresh-keys
@@ -16,7 +16,7 @@ IMPORTFLAGS="--import-options import-clean --import-options merge-only"
 
 # Make sure this points to your gpg v2 binary. You can also add other
 # flags here, such as --homedir
-GPGBIN="/usr/bin/gpg2 --batch"
+GPGBIN="/usr/bin/gpg --batch"
 
 # Run with -q from cron to silence most output
 [[ $1 == '-q' ]] && Q='-q'
diff --git a/scripts/korg-update-pgpkeys b/scripts/korg-update-pgpkeys
index 651e3d84a81a..4dc9be07c157 100755
--- a/scripts/korg-update-pgpkeys
+++ b/scripts/korg-update-pgpkeys
@@ -33,7 +33,7 @@ if [[ ! -d $WOTMATEDIR ]]; then
 fi
 
 GPGTMPHOME=$(mktemp -d)
-GPG="/usr/bin/gpg2 --batch --homedir ${GPGTMPHOME}"
+GPG="/usr/bin/gpg --batch --homedir ${GPGTMPHOME}"
 GPGCONF="/usr/bin/gpgconf --homedir ${GPGTMPHOME}"
 
 echo "Importing current pgpkeys.git"
-- 
2.47.1


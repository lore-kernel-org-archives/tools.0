Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5641C75E2
	for <tools@linux.kernel.org>; Fri, 28 Feb 2025 07:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740727284; cv=none; b=P/UbC2W6uR1XECFND7Hp6gvAoHcraMiIVvTizbfP58sMS1fQQeEjddBRz4tc48oALOPa8KjhItaOHmHFq4my8aaMdx4K2bNDoah/FS+8VyvQTqH6rVWfERMtgmm5uydqJ1B4KZDVSpcmCIiDFXi3Hgnhw89k99S6HxmL9BPjrpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740727284; c=relaxed/simple;
	bh=bopAVFP74jLA9aj4QYlqh03fGYW6ijCMRMthwk21EqI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QZBaSxEBosN2d+rbhuOHSztMy6yX05KVG6i65MFqUkVlvNiq+RyG3E/UCLpc7+IKmAhtRDPpGdiODa5Q9T/0uQbzPtaVJsrjNjuQvC7Pl0MhgrrAs7PJu9Wtmg19FEPogJ0/cQ6UcBz/ykm/bWdk3V8+yV3iZaq5ngwoH+PfJ78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cyUtTFv6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cyUtTFv6"
Received: by smtp.kernel.org (Postfix)
	id 1315FC4CEE7; Fri, 28 Feb 2025 07:21:24 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9FD08C4CED6
	for <tools@kernel.org>; Fri, 28 Feb 2025 07:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9FD08C4CED6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-390eebcc331so215748f8f.1
        for <tools@kernel.org>; Thu, 27 Feb 2025 23:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740727280; x=1741332080; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fwFSBoyL7zekd9w8uwcpmPbqJmg3yNa04HMah5E4mXI=;
        b=cyUtTFv6UmoudLhbN5CnfIWDNWacsGgrIwtsieAQQ55kWQW+6/uc7VGXhW5KAPNGUI
         C4zxAJ/MLFwE/NA3xXRRUoOaJ1nQDrlXYYEZZQcRnNVulSiA02kUZ2N+tlX1Lfs/LYxA
         tZiIdZoNhR9rlg8VvCkVWMepTQQLN1jsmurJQGP/nmbYEXERlgTlsuwqCms5PN9ak8IK
         DoRHFS67edb4lJ2JUT+ohDuMDOJMznK2Cz1dG1cRlj4VrIuacaIM2NWDU1ruqaikUSbV
         QcgOkiboPbImL2THcGSFTLWGSqlQVbdpRQxfiEkwni7kBPYLJD+XFw7qjVic/kIfDccs
         d2qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740727280; x=1741332080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwFSBoyL7zekd9w8uwcpmPbqJmg3yNa04HMah5E4mXI=;
        b=N8zqev3/wqSj4TFL3aiEqn7tDkK8i46cAnm5ed2PtL7iISTaxQK+QQ8mToNTGFejhc
         SjTZSaPajY9sgesIYsRIQ4HFsPEfkqoNI46jAfBIFjUH5JKxnZ2YBqeM3+keU3x3iB50
         1PKskosM2TbNc7dgllANnfwZXY5b3fEGaKWAR2RszNWCqIgH6N3EngyKpLKYDuNeWP49
         i8SmCBDbWc/q+eeaZYGHqNUIL4WWwA1emtlhonuai2qM92FH9xURuD1osT9j3tlb7jqK
         LHfbTI5GFP1yG3B5P+imj9R3z9JYBr2sPnVIiRRFnb5mLGjVhivrm3RDdexNej+uWGsQ
         67jA==
X-Gm-Message-State: AOJu0YyEN9HTWZqchgLE/mtoEl7RobLAM9CALkF7pcsEl0mK38IHIfXY
	Wj8cJKENm6cx21Nyfq0wjUt3Nb7dgKZjaj+JEx8TfrvvS9feI3oaPYrBefLjONJ6V+fa4juYQLx
	p
X-Gm-Gg: ASbGncvjnGEp8XY18X/NwcQ5OgXASi1YIDFheegRttUcdGeqwNEn0Ou5SO0StO0gUDl
	V5pQKu5eHfWb1CIYNxeAUtPqzHuGcPHfkYiJk2vM/2jA/PFUS2ylkmL1Dumg6SSVHrnv2uffk5k
	0q1nEl0dz3C9wsAxnTDXIV76bBz8s2V+BtNy8fw7KnUmWKFudocE7WjGCeJmVumj/gLqlT6imzX
	WiOtA9sCnG0/YGDlbYyur+5Zvyvzlhopj0VCVPDZJK/CkB+qXOVOLS+yUWVDzeeqG9h5zct7vjV
	zaHv1u7EvCT2OwwFmn/UB3qkN174ZjoqwO9kipuinJ3ih5Hf/pyC3Ii9mFDAdebb
X-Google-Smtp-Source: AGHT+IEeD4JaOgQ9TGqDgj2Djso4c5YYjYFsPUnYYMVHSUXr9MSM3VRyiTmXSCMavPIOOC+4RmEM9g==
X-Received: by 2002:a5d:47ad:0:b0:38d:b028:d906 with SMTP id ffacd0b85a97d-390ec1658f3mr2310549f8f.21.1740727279729;
        Thu, 27 Feb 2025 23:21:19 -0800 (PST)
Received: from localhost (p200300f65f2c000400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f2c:4::1b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e485d6dbsm4296268f8f.82.2025.02.27.23.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 23:21:19 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH pgpkeys 0/3]  A few script updates
Date: Fri, 28 Feb 2025 08:21:03 +0100
Message-ID: <cover.1740726978.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=660; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=bopAVFP74jLA9aj4QYlqh03fGYW6ijCMRMthwk21EqI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnwWPfTuKoYKsvWEE8qTtKe+8HbdL/H2oFBqu5o 3gapYOpKVGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ8Fj3wAKCRCPgPtYfRL+ Tk2uB/4zK1Ko5y/6afqL1hYUGVbHnuBXGarKb8QFivr9JuEFTxK+EsWpkC4o890i1noS6+4ywGO /mrM1qkTCz+tcCwk2P5+P6iaiE3txj9AKuE6UQE6gz6E15ddMuloL8eQFfPIYw0mzqSq2eI8OJM BLNOpnWfKrRQoX6J27YlFMSqe6AYZ2FPLdyHinayHw64deaK7jaufkOabRwMmWP/8q5KHLf2ggx ZxPA2OBaM3m/sboB6q8StHN2ZlOGtlqqmdflaZTmNIacMEWI61YHxVZZwNUnILqNSVr/rkJYWH+ st9MbSIDmVfBsAwYwlYhmZCFBzNYn4ajDIAtgxWcxNmdtE+Z
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

these modifications to the scripts in the pgpkeys repo helped me during
my efforts around the PGP keyring.

Best regards
Uwe

Uwe Kleine-König (3):
  Make scripts executable
  korg-{refresh,update}-pgpkeys: Use /usr/bin/gpg as default path for
    gpg
  korg-update-pgpkeys: Pass additional arguments of --refresh to gpg

 scripts/korg-refresh-keys   | 2 +-
 scripts/korg-update-pgpkeys | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 mode change 100644 => 100755 scripts/korg-refresh-keys
 mode change 100644 => 100755 scripts/korg-update-pgpkeys


base-commit: ec49467dc0fd7d01d046d30c7e5cf90fb06321b4
-- 
2.47.1


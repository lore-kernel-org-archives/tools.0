Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929401;
	b=CnVJbyUGw3kbl1ceWpg2Gff8CZMWJ3KuGSa438C97wmSCdGD3F3PZgMEcQqTB7BGge1F
	 MAktBCNM99CohvMS37OtEoEeXYfuvqW8OsYuEUYBxwKxWTGpxUDvEvUPUm2zBOZnYdqeO
	 kymrFUFdVzgjsItg8k8st1gETExNpxOsFidpiVofYj243ZuK3UlpwSKWyxZknsU4H0356
	 5OohgVI0js1946/FZkPYVFmkgUXJcqeEv6McwsZ3iXPWFISPtbYIUFHqEDZ+V8OY1uG78
	 zfav3curnvV6cPxF7MZEhtF17xDbEFGAR3mv+7sBSaj8w9HwBWw0C8Nu5L96TgmOIVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929401;
	h=Received:Delivered-To:Received:DKIM-Signature:From:To:Cc:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=haT7OW/skdr9WO6v5ShG/nLaCACSlPoy3WOLOpsBLro=;
	b=ATo6S8oGuZwusyQ0XoSLmOGkn2N7k1n/377OWzEG8HaMALh3C08vz7bFkLbPgEFvSXFx
	 nQATk3U4u3E3IYTDawoO3NccvxlgcC95YCjai7Yc6GDBeQD5pQ7Dh3IJgS1p0PELLyPGk
	 WduyPzkzMNiTYraNzlg4EsWx29IuTemPw7/sHpEFboL3sHEAZtJEfkdVu7P9GT8moRWkW
	 vnQFQgpXNoGmNz0nZRBU2OJWbQ/idb3Wu9Mg8kAz3H/AAnjBI99Fl0NLdJ8K8RzfF/yi5
	 z2Am4iRiz/Ss4co1lo+4XoqfkeK+wWdauuQ03vWMVYsQpYdoEuNaHLFbstoi+Zc8muw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=cPiSB9Rv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB321606A331
	for <tools@linux.kernel.org>; Tue, 17 Nov 2026 15:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=cPiSB9Rv
Received: by smtp.kernel.org (Postfix)
	id C2AD01F000C5; Tue, 17 Nov 2026 15:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EE11F000C4;
	Tue, 17 Nov 2026 15:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794929400;
	bh=haT7OW/skdr9WO6v5ShG/nLaCACSlPoy3WOLOpsBLro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cPiSB9RvNzqYxaPnEX054k68ty/QPyFrb1gWfw9FQ91Dl4ec03cs8C9nyM1H2djlM
	 1fITmKzpzJ46QkSC4nB75TBf+N3uMrhdtsUNvM9ThbDQkVKPgqef8AOAYY1Z9k1D+g
	 VkpRZUaKTvupTzC3l06tdxqES7A0DnPbeyWJox/0=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Brian Masney <masneyb@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <20261030-pw-key-command-v2-0-95fb0f822834@kernel.org>
References: <20261030-pw-key-command-v2-0-95fb0f822834@kernel.org>
Subject: Re: [PATCH b4 v2 0/3] review: add support for fetching patchwork
 token via git credentials
Message-Id: <179492939241.997809.6993666707201529524.b4-ty@b4>
Date: Tue, 17 Nov 2026 15:29:52 +0000
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=992;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=wT6r6peiTo6EC0SmWzTg+aT0FpD7GWlIQymBJPsIZpk=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLL+FH2W/LVifsIFVfGVF9/3Oley35eTThW4q3dGtS+HL
 WWGuqJPRykLgxgXg6yYIkvZvthNQYUPPeTSe0xh5rAygQxh4OIUgIlob2P4H8y4WPjCyb9H3y/d
 f182PfRleMCbKcFqEqkrrv5nnPSGcTvDP5PAay/8j87Xdn0R9kq+fpqa0Y0PT3X1f13JnK+9JHS
 lHRcA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Fri, 30 Oct 2026 09:47:27 -0400, Brian Masney wrote:
> review: add support for fetching patchwork token via git credentials
> 
> Currently the patchwork token needs to be stored plaintext in your git
> configuration. This series adds support for fetching the token via git
> credentials, which allows storing this externally in a password manager
> if desired.
> 
> [...]

Applied, thanks!

[1/3] review: centralize lookup of patchwork key in one place
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=a02d2c76e5071ffff33fd2dcfb39d7ff499262a4
[2/3] review: add support for fetching patchwork key via git credentials
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=06ea4123afebed14a2a617afe3509ffbaaebc374
[3/3] review: tests: add tests for the patchwork key
      https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=bf22d0198c34f68d068c150bdb9c2d90da134b56

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678425;
	b=3Mm7L4MWQ8s+GeMp9bR8J/x6mf4334WN/TrYUDOKwOv34SDbUZOqqMC7GEFOqaeJKFcf
	 lyvqBmVpOcHnZrQsCRP8iMqjyThBqWFJPzNp0SZNQJ0BiLW+6znb/GZnHfEGbRWi2tYhQ
	 dBGIxzHr97ysvyT1YkFq2mGVDUROjD8oml1q7fTmV14U45A1pID9KchwyQVKQgaaVF5Wy
	 EzR32bpv3N/1rG0CpDTSJGr9K5n0i4jYnmaKIGUCYM4WD4Sv+aQmYDtRa7ujkMQTo8S4y
	 vEFwQTXPZs/jSChH0JTTfeQceeyA/87K4aOHgdKBX1pW7P4H9QdYuYcjpIdEyrHs24A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678425;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=cgLnk5/Yk3QIdNkFv57hv3twYgCQ1yOQ8HUSlLmf9ms=;
	b=m+F7+adqIqqKJCf6Cdpjo8GEYBN4QytUdknnaR7QMJGgdE5WgjSy9cSZykmVE7pRamhT
	 w7TDRIC/XcwKK7ihU1IEABvZvmDmSEdshLwFXuNyT0FxkcM81EdbQdoqHz+agVl/ebtc7
	 6uly7RTRWGcemhYWpKr7Vz4sAy3fpXVss+42mSOzQxdGWfJtKe/gy3HNJYO6ZWkOqRtus
	 yuvo2JfvkPbAjbhYCw/CBivFC5WQo6YcRj1U/ze8FarDX7N9ZdrRjQQfLgCb0J2UEAWk+
	 DH2TWhtOu4TcWQAHhFKsQJa/3nzrketKI3JYIBhpgbWF8daN7Mqr4XIRp3cpY3D9RJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mKDZEQCB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A29606A32A
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 07:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=mKDZEQCB
Received: by smtp.kernel.org (Postfix)
	id 9814A1F0089E; Thu, 26 Nov 2026 07:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16EA51F000EE;
	Thu, 26 Nov 2026 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795678424;
	bh=cgLnk5/Yk3QIdNkFv57hv3twYgCQ1yOQ8HUSlLmf9ms=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=mKDZEQCBQWJIDMvPfYB/enae/aeD9nCPJnIBrZ6LTIMIWUxbtRrRTFWZkmukWBd7c
	 QsgR2yhT6Pad4WhYjP8kW1H6GjKcKE6t45pPN6HzGDDEGOTLDZv6ioN3Q/EzsYXO86
	 0cyVda+32FGHkBJFokph5t33GYGcmR3s3o2f9O7o=
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
Subject: Re: [PATCH b4 0/2] correctly walk a series when a message is
 missing from the lore archive
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Brian Masney <masneyb@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20261117-lore-missing-msg-id-fix-v1-0-a5d13a11eb10@kernel.org>
References: <20261117-lore-missing-msg-id-fix-v1-0-a5d13a11eb10@kernel.org>
Date: Thu, 26 Nov 2026 07:33:41 +0000
Message-Id: <179567842198.4097193.9480418861709200271.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=693;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=vhC2xLsOdVfozpynS1EPwlrXZNK5Hyg4FtR1yj87ycI=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZH1ybJMR3/USJSpr8uUZP97SUTyGh8rlJ2zh3pKjX5
 ayrrJrfUcrCIMbFICumyFK2L3ZTUOFDD7n0HlOYOaxMIEMYuDgFYCISaxn+GRVOirj5QPUM50fG
 sJw7B4TKPDo3+ZyI5Y+o2vRA2PSYOMNf8cNZGknbui/nLhIunBjL+HlnW03e1JzQ1zqNl7oDXsi
 yAQA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> Here's some fixes for the 'b4 am' and 'b4 review tui' that can cause a
> trailer from someone to not show up when there is a message missing in
> the lore archive.
> 
> I ran into this with the series linked below. The message from Brian
> with ID avXhA9mJL0EIcm_0@x1g10 is missing from the lore archive. This
> causes the Reviewed-by from Jerome that is in the archive to not be
> picked up when 'git am' is used. With this change, the trailer is
> picked up as expected, and the messages show up in the review TUI,
> along with the trailer.

Applied after a rebase on the latest master and a few tweaks.

Thanks!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

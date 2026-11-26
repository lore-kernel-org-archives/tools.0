Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681934;
	b=uIxm47rsdPiE+HqQWRR+XCsOivYps2nyxCmV55dlug3lrZtjHYOkZ2qFQOaYn0jBrrfn
	 eCmx3jxxDFmdSC3M/pwdlQzyRiPxT8g6CaFIuR0tdwOVNkygKNrhYCOWmR6PQ2lOLoqGW
	 odd7aWwBovrtC0L8RsolQbdOBCqGQYcZt4QqnaNTqnhgdob74+BilZXn2XK7kbS62VoZq
	 o41m5KQ3ohdtPrq1ySpKIpCUCkrln27x3/7EF9aJs3kpcmCb2N8OtaR9aSuvnPcPhj5TY
	 tThiC7WlbgO++svBTkCOCfbtgXb+TvXVv5tpu9+kAlKkeHDUlyFhJZA1VXNA6CKsBTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681934;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=4LQMNgWCUnlF7ElvoDCZNb7fxyFALyJJ+L4hONznFaU=;
	b=jfCo07LJYccuoKP48IDx047Rp3dRX8oiZs3IFZFbjpimzPrlMcZydm+kt1ftw7FIR2CG
	 U5CNfUXXX4oYLh6QB9ojI+L3EIzOIiKLJsPXH4cENn8EAFmEAf8+2WMuYN2vkenaLqJ2C
	 s0InuMda8pIOadmXfx2tG9e598xlKrKCdVA2jPQJu62y0Du7Ik2jrNxbGCNR6/xjvopva
	 U0pSK3gDR36Lu4vDrnbR6I0Yxq4RK3IKT3zqJy7GnSTTnqMpTddmAnBbpphT7sGzFsqFH
	 5ul99j/g83a6c634yLWJ+QoB47hpTseZ15EywfLFJxLssudj3EE2KUNoF8T9HiQehIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GRFHqdgu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E11606A321
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 08:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GRFHqdgu
Received: by smtp.kernel.org (Postfix)
	id B33B01F000C6; Thu, 26 Nov 2026 08:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2151E1F000C4;
	Thu, 26 Nov 2026 08:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795681933;
	bh=4LQMNgWCUnlF7ElvoDCZNb7fxyFALyJJ+L4hONznFaU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=GRFHqdgulU91yXPdDbju9zqtSXaawOKIJ2u9GwauAGSyNyE4HrjcVBKHbnL0qi64U
	 ZHpri9mPcMTduZwDSEDiQiCUr1aVmIkuzqjX5dKdvZKijyEyQF+glKugeT2S087fE0
	 xfc3eJCoS0EAa2VtErgA4VU+Y3rro5pRD7HC8Yro=
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
Subject: Re: [PATCH b4] review: Allow custom Patchwork show states
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: tools@kernel.org, Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20261124153131.100246-1-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261124153131.100246-1-krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 08:32:10 +0000
Message-Id: <179568193093.4097193.16381307416113878577.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=393;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=LwkDus7657Ae6KHfJ02jmglLgKDo3wFB8f0U/zpgVRw=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZ33WbLNlyIOFNws1ZZ8PPZphq3Px2VCj+/vct2Vd8N
 5sdC955paOUhUGMi0FWTJGlbF/spqDChx5y6T2mMHNYmUCGMHBxCsBEzscxMizJn7b32D5ew9lM
 mxWK/sVYOU7IOvq280KbnsyZmRpbHdoZ/me90g7R7Ar+Fq4oldx5yyJT8dPkuetC3ScGpn4qe1W
 exwEA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> Patchwork in some subsystems, like Linux Devicetree, uses 'needs-ack'
> for patches waiting for review and typical state 'under-review' is
> reserved for automation stage.  Add b4.pw-show-states config option
> allowing to customize it:
> 
>   git config b4.pw-show-states 'needs-ack'

Applied with minor tweaks. Thanks!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

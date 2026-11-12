Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794513521;
	b=lGsZLnfPQp8sfL5m3/c4Eb0Ccs61PKuLr7eAwbzxlC11larYF3lgQgo5zROoHCXwMYtX
	 siF2CfgNc9K+u+lNXthZAZ5U0qf6oINFTTml+F7QYAR7vifXdzBsEqylxfD6p8bOPx9ce
	 RnHi49ezAMWpLSuzgPkvsNucnAAf8Xg3D4BrHUbkY+rmLb1+Wf2XdDIhXiDIND05eDAWY
	 7XxLtCRNw+Y8QqKE/Q5eGFgr2DPIxeXS+iDb1pd2zhUTnSPeExOTHlMjCildME9BD4cys
	 QfAnEec11ZZQK3zafyLJENDX4iADrBJ+li+5ykKcSme5rLE3iWr68uINwJNpWH8sVOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794513521;
	h=Received:Delivered-To:Received:DKIM-Signature:From:To:In-Reply-To:
	 References:Subject:Message-Id:Date:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=e3+ag7tpBJ7W29OagoVvPumAFKODUSZnm2rtyI0Qg/Q=;
	b=CQqPlkTKPgSc6b1k35hdR61EfbAEDETgFLa8Nv3PFl5j2eJIJrPazRs9vhy/gG5pnTf7
	 Hg7Q2McXz0488tHmAHF/aMfBCS9h4FyM8rzhcO/r91t43/QV+LZPtmFcph0d515c8AVz7
	 IprS26r8QC0g9QukNgexJMSpw+zF1IVMdYKiOPCklR3XZ5h/X2WbNiITlB5sKErbj8KG8
	 J3BOk0F5DIZ9LL9GwXeaSBB49lfYWWyC9kt26srCtkxrctHk0/jW3NgvcbkDOqscUb66r
	 n849/NSM5oHIrmIXuZdgfdUjABKZsJtqjTgxoXNKgdrspcKlhzH/Qo8g/OYKmSCePJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pqb2n7SD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D86606A31C
	for <tools@linux.kernel.org>; Thu, 12 Nov 2026 19:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=pqb2n7SD
Received: by smtp.kernel.org (Postfix)
	id 7932E1F000C5; Thu, 12 Nov 2026 19:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359D01F000C4;
	Thu, 12 Nov 2026 19:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794513521;
	bh=e3+ag7tpBJ7W29OagoVvPumAFKODUSZnm2rtyI0Qg/Q=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=pqb2n7SDkxlrnoTUQpWGg9OgL+oybrVBBwDNpvXNcAM7vFCjW2QMcLNOCaTHYjClB
	 7lGwuYxD1iwk191MB3wuIBbDWrvMFB5hBq691ZAr9cl26Rp2t5Fp34UME1PKFpt6cm
	 XDnKO49xjFsuFgfcXEgUArzEdT6e01rUlSsr7ByE=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <20261110-token-command-v1-0-a089145494d3@gmail.com>
References: <20261110-token-command-v1-0-a089145494d3@gmail.com>
Subject: Re: [PATCH kgl 0/2] Add token_command support for Gmail targets
Message-Id: <179451351751.1693101.17447992335011128114.b4-ty@b4>
Date: Thu, 12 Nov 2026 19:58:37 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=bCEBHJc8foQT6bCUTZ1+dJd2rM6C2FuDbWjWUopxYBU=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLK+SeXf3XJHeIXpTCEupZdLniTtu/lwypOUJxyN6at2X
 n6o6BdT3VHKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAiSxQZGZZv1S7Ytfu2r2rA
 IvU6mb+BOZverJx24qb+Pu3g/e1dk1cw/JUIDVbqZzFcuWp/1Iv/PjcNpz64Mkf0yc0jO8P79RW
 fn2IDAA==
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E


On Tue, 10 Nov 2026 22:59:17 -0800, Dmitry Torokhov wrote:
> Add token_command support for Gmail targets
> 
> This series adds support for obtaining Gmail OAuth2 bearer tokens from
> an external command via a new token_command setting on Gmail targets
> (similar to passwordeval in msmtp or PassCmd in mbsync). This lets
> korgalore share an encrypted credential store or OAuth2 token helper
> (such as oama, git-credential helpers, or custom keyring/GPG scripts)
> with other mail tools without managing separate Google OAuth client
> secrets, running another browser login flow, or keeping an unencrypted
> token JSON file on disk.
> 
> [...]

Applied, thanks!

[1/2] Decouple GmailTarget from OAuth file credential management
      https://git.kernel.org/pub/scm/utils/korgalore/korgalore.git/commit/?id=1d5b42b214461500a8f3e00a9bac7fa8e0c04237
[2/2] Add token_command support for Gmail targets
      https://git.kernel.org/pub/scm/utils/korgalore/korgalore.git/commit/?id=c7bb04ec81b8b172b388345ceb48270dd2962c38

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>


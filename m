Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795542535;
	b=E8Flwzr2gaXHvGYB4Djg1ReIgmCbY2QNf9rysutk5oceFTuQlDZS94PBlzLkU6ZryFsf
	 zoFe+or+eD2mElBD01nl5oib2rtDM4ZHR9km8UMJ/Mig0IPV5E75zXhnJAZFpVn19dk1/
	 TISTEk4tdfj2eRiC0+WVXkZDFJWRl3pLzt6mZTm7J4rpSDNk9J2s0s0FHtTsmBqYmVfiT
	 ATG9dz2tAnCh3x86u9UrYlrs1X1UMjCsIFmvVt6m3mR/Qi790k7KM74zMWeaeB//uVWuU
	 0JylIUAzHtAiypn8DF/+rrjUMLx0HFNQPREvJLYwMtTeS/jCxEYtn5zbMGsV2chKyFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542535;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=YElRIznlCcptmfe6Jcetf3ajsshoDVqs1K+si6Tv/e8=;
	b=RGqyvV3ma5A/PnazPmIxvVd8LLvAsIhO05SLTCA6yEGTPn59ljBR7ny4Wl8WGL7rSHEt
	 Qk/FBRgbV1xReN5VUQ0+itsjntdUWw3qFfvae5BzwTzMf1gmf9uo0aHvYUzm5+ZbgY5J+
	 BkRREGdvojevt9B37tloxAzZ0aKcbdHvSTaCFSfyzA8GNhMf/GTWL8BcOw77hfEbdjEz1
	 C/Q1Nc0I4OeXv1gERVE76qXMDwFV3LqUzh9zAyRIUtuqaN/aQxTWaSKH+DwARcG30IMbx
	 nY7V9jB8jJ9mtG929DtTSvN9hoS1mMuHUPWSPASzbgGW/tzzpN/f1a2pmXTyXmJM5pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nMaIdj5o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACF0606A31E
	for <tools@linux.kernel.org>; Tue, 24 Nov 2026 17:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=nMaIdj5o
Received: by smtp.kernel.org (Postfix)
	id BA5171F000C0; Tue, 24 Nov 2026 17:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153EA1F000C4;
	Tue, 24 Nov 2026 17:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795542534;
	bh=YElRIznlCcptmfe6Jcetf3ajsshoDVqs1K+si6Tv/e8=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nMaIdj5oddjyR83XZp41cXKxBCCIqpvrhGh8tbmwKhR3DRYp0PG4yIIrtn3/rrMGe
	 kzDDDHs/X/6iDJV+yGDE7N51fZax+zRqZjNHz+nkPhGNQCrLU3KQQ5vPwr8nFJG1af
	 o4tzBLtpgf97YOwIdpdzDWRCCWNsJus9XvkvTWu0=
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
Subject: Re: [PATCH b4 v2 0/5] b4: Implement BCC support for patch
 submissions and review
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
References: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
Date: Tue, 24 Nov 2026 17:48:52 +0000
Message-Id: <179554253247.2618396.2715348436311425659.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=339;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=F5kuDK791RrW0sA6hSbbftyCrhTNEyte9hCR8f8nHz0=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLJZz7GY590/Oye7c9HmZMbrt6YscJ7pW/hkiuCKK0dfz
 eyvaOff0lHKwiDGxSArpshSti92U1DhQw+59B5TmDmsTCBDGLg4BWAiH74yMmxbo3c17FOXlniP
 Q89LhxmGAeKtDXO++r/atub7a7eXF5cz/FOOvTnjaeYBuWsil8QDzJ6a3X0l/XardLheXXM9e7L
 2AgYA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

On 2026-10-11 22:58 -0700, Dmitry Torokhov wrote:
> This series implements support for sending patch series and review
> replies to blind carbon copy (BCC) recipients.

Thanks for sending it in! I applied it with a few tweaks -- it is now on 
master.

Best wishes,
-K

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

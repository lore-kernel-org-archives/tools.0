Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795676350;
	b=P0AF8I7eURzWFC31KwBnUK7g94oyh1NxmygPCyxG3r02kHW+UGIioDdb7nf4fFpseF+D
	 T9LmhlH+K8742cZn6zulcJX3O39urzSkOds9qrvr6EHc8Ktni+DhVIiI3FmW6moRshnJw
	 GJa1GSRTGJ2bDzNRkrFCBkn4gqwhpyS+hOpJlFe/l5TbVh33EK6aBIXQFOkGq+0wfxAwu
	 SHQeysxaOCcXO/bzaNCJCv2kBFcX3X0j/VdgnHukGHG19fVjXE6UIbpntbcYfolY90f+P
	 FTLx3G/yAK57CEeFtXpJzOUpG8/e8K8t27TVa9kcJbR3zvRfBlatdDyY66Ub5wtMY/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795676350;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=T/r5lU8U6d6f2vaob4AnweiUj4bMO/M/+7f7zJE9s3s=;
	b=IX/2X26hKnQwsSjhJhMvHTMcmy/pT0gnuVtNmzrWqDKvB0WjaRORKXcKVECBi87DMnj8
	 ZoJpoX+0ZDIKA9ATrQPZj6iTakzlqCdOHPN7Tip893VWN64/1xfPVmsM1+yuwECNVoMzw
	 K6ZCBj9jyq+NnxDsb0xii1If3YYWE4yIx2Iciel95HI8hZKrHYGNZzOQ7FJSr0d42DUfO
	 xbr3RO4ZoT6NGvVoWM+y/TX3X8vI3sLI2fBhsb4jdeqZHUuXa6CuW124tzlJdF7NHYJIf
	 XFywubx4Bt8AZgQtOlvxTopCXRPTSthk1U25Hq7pVYWh5CIsDVFwRr0id2lIbaYDnGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=LdluyltG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30302606A31C
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 06:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=LdluyltG
Received: by smtp.kernel.org (Postfix)
	id BAC5E1F000C6; Thu, 26 Nov 2026 06:59:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55AB81F000C0;
	Thu, 26 Nov 2026 06:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795676349;
	bh=T/r5lU8U6d6f2vaob4AnweiUj4bMO/M/+7f7zJE9s3s=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=LdluyltGd9u0Mdxd3peLeaIjlxZo+WkrWv0YM1rjQJJfoM8iv42p5BLkwueZmJTwK
	 BhL58sSGg0QGrnpkMYtRXhS8Qcnt0EqlQC2yIBSjVIbPbx6+gfxHjocv8sD4Cyp47F
	 inxLjT5grdB8WzuQRghMaJNaucyUzu5h2RtJUo24=
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
Subject: Re: [PATCH b4] send: support sendemail.smtpDomain in gitconfig
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Ye Shu <hello@shuye.dev>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261125-smtp-domain-v1-1-9002c1f3ef21@shuye.dev>
References: <20261125-smtp-domain-v1-1-9002c1f3ef21@shuye.dev>
Date: Thu, 26 Nov 2026 06:59:06 +0000
Message-Id: <179567634676.1145923.8156751181922148927.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=878;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=2Pfd3R9tbXd0FR7f3fsaAEICD0oH543UWOLLocIJ6Hg=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZb+x2OHhW4530sncLqvvOShtqF3dNm2+l+GCa6CTO0
 B/CvTq5HaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACYScIvhv7PsyeIJO29svXPr
 sfLmOqbjZhe/cHhySwWs89h5JCMicD7DX7nse5wsP6Q+tp3Y964+8HKtvO65HbuCy1Z+faT1b8X
 uNG4A
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> When using own SMTP server, b4 does not set, and let smtplib derive the
> local HELO/EHLO domain. Its default behavior often results in internal
> FQDNs and IP addresses exposed and saved on the mailing list archive.
> 
> git-send-email provides the sendemail.smtpDomain configuration option to
> override the HELO/EHLO domain, which b4 currently does not recognize.
> 
> Support sendemail.smtpDomain by passing its value to smtplib, allowing
> users to control their SMTP HELO/EHLO domain without relying on an
> external SMTP client, while preserving the existing behavior when the
> option is unset.
> 
> Tested preview submission through SMTP with sendemail.smtpDomain
> configured and confirmed that the configured domain appears in the
> Received header.

Applied with minor tweaks, thanks!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

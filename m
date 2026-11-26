Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726384;
	b=TlP1urt7u1ZLpXbf9fOGAU6hMUaaVgifNCwa+pvPnmZClOk4j7yC32q+N/Fx/BifXS2y
	 F8Y3esNPozQtTwTbIezCV57qfrv1YcXYblvcd4+MDze8DFQ0KDDIwUcalPYrikudZ8F8S
	 v6xB1A/qvOsMBAv1p+6l8Hf8msLJ5EnpJvONSfp3iSLVoaS0ULEHwrGyeggF8vsQWNXBr
	 nUTQNy3M0ax/M+qBpS62grwW/LD6MQyhg2bOnc5A9NbrjoUTlk+vWxsgqe3IDPKPhuAxE
	 S3XtSTFPxdEzskUpXduuJLj/2w0W0at72Z30ngeJ6Tti4USGq6bMh0wVIWkh/f/atng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726384;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qO0XNePCXrHB5TWEjfcyPVp3ckqw0t6CdVn+QA3RBXI=;
	b=NCu2WlLbgWsEB2XJzGc/1m9s1x5fy7XoIBTiI/9Z/HU8yE491+O4HHa2Tkl6+WnK0OFN
	 Gkmtktph5FdYqXwUFVWussXDKLDQJrrHzLk2dB+npr4WsytHb2aUPf+FkIMmrbBf6W6fL
	 QPL7SWZ8yX5W0Rd1VzYi5akc7hJyKNSbcyz9mhu56XfK6uR0hUlroy35jpppHp9JIJ8JR
	 h8PU5QSgI7ZJi8p6rCQpxjzodFKG7iFw1iLTMGiSinhn3Ja9ytFJhwwdj4GkgWL63lgdb
	 Il/XEHUC7a7zjKUltBOUICQieM0WakCfURw5dsCbATseJym1WsfDZt1HeTKJBdNnYcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=X7pr6ShN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97934606A31C
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 20:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=X7pr6ShN
Received: by smtp.kernel.org (Postfix)
	id 604D81F00897; Thu, 26 Nov 2026 20:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2A161F000C1;
	Thu, 26 Nov 2026 20:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795726384;
	bh=qO0XNePCXrHB5TWEjfcyPVp3ckqw0t6CdVn+QA3RBXI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=X7pr6ShNKWujW/CFTuVMXI8rdno+FsL5sq3c6I49zUvcLfkPyLWm79tBrf9dHAcSu
	 BoqEs9FkEUFRXC/200qnGynf9Zf+VWc/DuPOMRZ5zF29IGCUoQzlw+Kwz/CGWmlZFn
	 cCM1fJBVa5cNguIQAJ/4/tLYB811PhYR4vx7K0fA=
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
Subject: Re: [PATCH kgl] Fall back to Date when Received is at or before
 the Unix epoch
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261126-submit-received-date-fallback-v1-v1-1-351156bfc4d0@gmail.com>
References: <20261126-submit-received-date-fallback-v1-v1-1-351156bfc4d0@gmail.com>
Date: Thu, 26 Nov 2026 20:53:01 +0000
Message-Id: <179572638192.97082.918095237344817393.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=562;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=NyNcdfux6ajSzZ4lHKu1RWqvBN3xDs8ZvlkyP5/p97s=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLI55uj9anQvPb+S61j4u+lvpCtWMW0+b7pgJ5/MdpPn0
 pXn5T4WdZSyMIhxMciKKbKU7YvdFFT40EMuvccUZg4rE8gQBi5OAZjI8jxGhvM8zhmK5bLT5zSL
 /nH0dl/q9HTy3vtZH54d3H3GatfT0zqMDIvbDv7WiJ0m3u/u1W26aVXk+VUhCstY+jSfPY3xrKh
 X5QEA
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> With message_date = 'received', an archived message can appear newly
> arrived in an IMAP mailbox despite having a valid Date header. If the
> latest Received timestamp is at or before the Unix epoch, liblore
> returns that timestamp and korgalore discards it. IMAP then assigns
> the time of import.
> 
> Try the Date header in that case and apply the usual timestamp bounds
> to it. Keep clamping future Received timestamps to the time of import.

Applied with small tweaks.

Thanks!

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795708917;
	b=EMNc/P9AbL2B8nDO8ewsdpdBNrvElAB049iZKI/+zBBS7IA9qqwxm15SKknwoCSvL/cd
	 up5xQn6fhroYCtnuvaGnj0dWKkk/YE/SMmVu/NCIziAWIBvDmLPQ7NvfP5Q4GKKbUmcji
	 2H1CEwJbbpBxo2ssPuRNP65HnxEIYYbrT9psjaLbS0+4qtXsJb+U457GYMB+Q8yPzaANs
	 cUw09MGegvPt63CKoNDWVGRuxNMYDSB0d/SskZWD7TEquC4EA89rDkjL2zNDydM+8qcjT
	 udlPjNbtARdHxfoiWTGONXqkVsB4GfIhZKg3x/FM/8etClBtNrGGc7/uY1nkfg7TJKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708917;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=qjwQlisDGw7i3HyW471O3OxKTvjUALrOvWc8FTjggZo=;
	b=H0Kxqa6w3cZbPyQIutlK0ad28ANvM9Y+SDt4eXt+UaO59hTvqg78XghugJcBAxfz3iqu
	 CDfsXHyHQf/6mNs7hXJ2BZbVLk9hqwcpgiwpCnFOWZ0asTGSs9Rcq2Hdcfa3msGMaSInf
	 SbAF3Zt8ga5ugtG+yFta6Bpvf9+kv9U9VpJKLRxq/Qn5ndleKeY44eSPvLAoM1N2o1U3q
	 XFYeB6uPClPxdcke9FDtqX3bV681wkebfK2jQJulW26HCNsOaxqoMhBOGbzZaeJYBfDES
	 6s6giU8EeXdTuV6GNq1Oy/61ibD8351l7dQk/nfH5lnoKu4aSVtGTN0k4QVOgXcaPQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="U5HkOo/8";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1ED5606A31C
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=U5HkOo/8
Received: by smtp.kernel.org (Postfix)
	id 632051F000CA; Thu, 26 Nov 2026 16:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F781F000C4;
	Thu, 26 Nov 2026 16:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795708917;
	bh=qjwQlisDGw7i3HyW471O3OxKTvjUALrOvWc8FTjggZo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=U5HkOo/84phXFDPe07AvK+kJBmCsWaSOEm518cj4CWQ9egnhGp9vjaDmk01ZWMQOM
	 rKX7xMMS4tzOjxQctW4fzuxbplzp0JDEdwmjh0qTrQoIC1AS6TeW3Ibb+LwSk7K1x8
	 2uksQx1AfF01c8OahCHAFGNFTCxr/8erJfYJLoyU=
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
Subject: Re: [PATCH b4 0/3] send: fix SMTP resume across transports and
 recipient refusals
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <20261126-submit-b4-send-resume-fixes-v1-v1-0-cf5e018d8d7a@gmail.com>
References: <20261126-submit-b4-send-resume-fixes-v1-v1-0-cf5e018d8d7a@gmail.com>
Date: Thu, 26 Nov 2026 16:01:51 +0000
Message-Id: <179570891191.2238394.13161623245972083134.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=668;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=EOAGAjb8Dt1qVPa8KEzegkpJad86+I1bJdEzVtNL4EQ=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLI5wj94cStYJ3v5uZyf25CumN5WtvlZS3HTxieiD74XG
 qccVM/oKGVhEONikBVTZCnbF7spqPChh1x6jynMHFYmkCEMXJwCMJHr8xl+MQuWN1/Zv2PlIwPB
 5HdfTj9d9fJkpF3yD9erDhJcZ9+KbmJkOPVv8s8DjRGKB37Wrn1ybFdEW5PLJxYzm/LTSoYFlsa
 TGAE=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> If an SMTP submission reached nobody, a fresh send may replace it.
> Make that true for local sendmail and the web endpoint as well: once
> the replacement goes out, the old messages must not be sent by a
> later --resume.
> 
> The other two patches address interrupted delivery to some recipients.
> Let later messages proceed when all remaining recipients of an earlier
> message are temporarily refused. When an explicit Bcc overrode an
> exclusion on the original send, honor the same override on resume
> without bypassing a newly matching exclusion.

Thanks, applied with minor tweaks.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

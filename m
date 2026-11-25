Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795583609;
	b=eGgBfzhzErIQTmGcLyQBnnig2igpWGDsefvu80CL5OC9owANJL0xFywEMEx0LvRel7Ir
	 xpV4buo4Iy9sKun2xfEEpH+f9rWGAud6/kcTIPhgSrOYO+vyAzP5c0pVJX89xMmywZXhP
	 uxEoMsTEtXXRxPDEewHIP3eq9s+BAMPxjUCQsxZABmHhPXGcRaIH9jgfMOSeFF9V5im7w
	 tUxSvQZQ41fDC3TQqFV2Ed1VSajODHqgY2DRhRP9BqDhdqfhhFWYtACyirT1jiiibVWBX
	 aFw2xpnc1cU8G8jzv2zppkJYpgJrE3qBAq6GdaOImWbRwHq/iHI2ETQO9EkSAHqOlOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795583609;
	h=Received:Delivered-To:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=d3UmUDdNQgB1QM+wEWmsJC2FXm7jJZrZ+lfN5dgfTj0=;
	b=Ofi+sx2edwYo5DbPg5QnhN8fvLO3K2/qkcYEvc+SFuUe/jKKjYJCKpAu9rtDk1+kn6TY
	 4pWOqyhhL7LsTKkRxW5yLhIhHxVHG9D/gaKdIJFnFZKd7zS9KoQ9Sf/JkDNBssu7+RHHK
	 MUITcdcbVty2AqPRbiHpxviuw5W14jr/sYQOKUmwo+mvsQhlGIL4oAy1MbfDWRZhP1yj6
	 Jp+TpCBDt3UE9cYvPUYgWcvBDWwZxGyUJZ1lLTeSKtvjmAnsDjq9fTh+r6UzY1zeUZD8F
	 UAiRDuGJEtoP1DJudrWb4hRbanjOES1tQHDV4nK5iwHtkrpN5mBKv1o0uL7Iy0vKq6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b="Ob2n/4/b";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DDC606A31E
	for <tools@linux.kernel.org>; Wed, 25 Nov 2026 05:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Ob2n/4/b
Received: by smtp.kernel.org (Postfix)
	id A7FCC1F000D4; Wed, 25 Nov 2026 05:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AAAB1F000C6;
	Wed, 25 Nov 2026 05:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795583608;
	bh=d3UmUDdNQgB1QM+wEWmsJC2FXm7jJZrZ+lfN5dgfTj0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Ob2n/4/bA01UT5EAWAxWENf99lJfbu69axi35HYsnPxWaMNS4vitCLWLCWU8e/A9n
	 9kdRjWSQ1n8AfJENN4OexpG2Aq8JBQKNOIdnoqMiIQbNmbTkcVTig2oxVmF/1Fkwhy
	 bsmyVx6oRP9R1j1mwXE3DW4aHZRd0jQQVj4kSkeE=
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
Subject: Re: [PATCH b4] review: send what was added since the last review
 send
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Baptiste Le Duc <baptiste.le-duc@vates.tech>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
In-Reply-To: <1792769241.8631fc262581453bbf619ec5b2062170.1a1695fb28e000f79f@vates.tech>
References: <1792769241.8631fc262581453bbf619ec5b2062170.1a1695fb28e000f79f@vates.tech>
Date: Wed, 25 Nov 2026 05:13:22 +0000
Message-Id: <179558360268.2933355.3254336246147018711.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=590;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=bBXYFBcZ3yhFYhs9Nczp/OXDVtkIHkTV37Vw5Pc4Ho0=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLLZ8or/zQ202H+9M9V6/456j0X7jhzzk5zIeaj1qtQZR
 iWveVWFHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACZyK5Hhn07ib/7fZZensDUE
 C+2XZf/P2Ks00/TynTWWLOq7rRp5bRn+V3wSjtqj0D/l5OWdxhkfu5IW+kQfLvn+ISRweR//8XO
 SXAA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> Once a review was sent, every review in the series was stamped with
> sent-revision and collect_review_emails() skipped it for good. A
> comment or trailer added afterwards on the same revision was kept in
> the tracking data but never sent, and the TUI only said "No review
> data to send.", so there was no way to follow up on a patch.

Thanks -- this is applied with some fixes that I wanted to be done as
part of this series. It should now be in master: please follow up if
something isn't working as you'd like.

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2B1483BE9
	for <tools@linux.kernel.org>; Thu, 13 Aug 2026 15:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786633301; cv=pass; b=Cv4OyRSVTwUMlxhWUPJoIBFAANOEIS6BURvi536kT9fG0gZQHY4O4NB439PAsEYu3JChDzH0jc0kVFBU5r1KXgbuBYexLf2A7Qz/T8fEXDVxavt42Lh0vbp4yYgfkzt2qELEeryJodu7lOr1ZuWj9j3cToSo8gWiPH/hCQj9WLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786633301; c=relaxed/simple;
	bh=47228c6mwrwCFoOYOFJF314LC9C5iWjAtvP7Exzj3fI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AQYU3lug4qd9MQNvI0tbTdm1wlLUG056FY4s08KyiB1JFpYGvHh5qRnQa2rJ4HUMCMqq7hLscwrrFnZ4HALkY8RmWKTP0SMKS2ClmMW4Tdc5R6CHHuSYeJbKge2U+FKok4273n1kN0/7Hut2VmaBQhQm8UcZysU3LMJBqiWEKiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=privacyrequired.com header.i=@privacyrequired.com header.b=dScnafpQ; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=privacyrequired.com header.i=@privacyrequired.com header.b="dScnafpQ"
Received: by smtp.kernel.org (Postfix)
	id 7FD151F00ACA; Thu, 13 Aug 2026 15:01:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=185.218.207.228
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786633299;
	b=cVY6OFc/X6RKcc4JFWFt4zCOnuvTMrjYLSUxXuKs0iKijkg25pghfPXfm4oCB/wFK0sC
	 77tlaYi8Pi88ItDA7/Xx3ag37zj/BZ0x3dJ163mgktUQgCQCjafEKGlVv6whXfUWfCgzh
	 kwhnMBSDNipJgu3+uNP+8D4WuMa5DnGXyDTxLYBV8zSI3R7YVWdEur6Q0Sprn4/sJByx0
	 ZPASfT8jf6+dw4yP4k6FDNJkwmEOUbVRKgpuFTJN94IA3KLVoSd9zZQclowOpYj9+UVCL
	 CA0venojYJVFKjlCQGi1iKvmimJZpLLD2Qy7CxU3DY5v2ReLPg+kFZy9YMR+io/zVYw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786633299;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=7WZnUvfYkOTTsuqH5/XMnYy/uMCnuOzvuQvHa2zGtZo=;
	b=fu/NwbHlX26qV40/0Ousc72y+xPCz3IgeTaNb0m3sUj6i2bF+VaqOmH1LwYkkyOu/y1U
	 uJxCVJkywDTRygGmn88ThDCh9QYw9LP0qbEaWm/AqsgSwuVhiMcixz7gbVTp3xXIbGSaC
	 sB4YmfSqTdrok7nODrvaZGloa3jst6a8qy5LQZrnylV+MESeWJPShU0PH+Cp8lyhGoLvf
	 vU5+P8NOrjTBpf9TG5NW5CsnDExoei1q/ZcfPjQouMVgAPNr1GZh5mVjyhxxT6VbhFZHv
	 Y6sradrADjQt54AKlZFuJxWrCQ4TXC0WXLFu7dZRsIAQYv3GJsuoSna6VP3avBS6QdQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=privacyrequired.com header.i=@privacyrequired.com header.a=rsa-sha256 header.s=stigmate header.b=dScnafpQ;
	dmarc=pass header.from=privacyrequired.com;
	spf=pass smtp.mailfrom=privacyrequired.com;
	arc=none smtp.remote-ip=185.218.207.228
Received: from latitanza.investici.org (latitanza.investici.org [185.218.207.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8A331F00A3A;
	Thu, 13 Aug 2026 15:01:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=privacyrequired.com header.i=@privacyrequired.com header.a=rsa-sha256 header.s=stigmate header.b=dScnafpQ
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A8A331F00A3A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=privacyrequired.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=privacyrequired.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=privacyrequired.com;
	s=stigmate; t=1786633295;
	bh=7WZnUvfYkOTTsuqH5/XMnYy/uMCnuOzvuQvHa2zGtZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dScnafpQ1xmrpna8EvZGJa4Fw29QjMbeJ1SblJt4cz8Nf4CUuBp44UXjRSjesHVTX
	 RpVlhM8GQCG13uL2nDfQSRbxXsYZ5J1a/FeTGfGx6akaVRXfydbAspmvqKRs9SccsF
	 SEqjfFfWNFxsDuu/4PzODYgRuFeoZ31jF2U7zfdQ=
Received: from mx3.investici.org (unknown [127.0.0.1])
	by latitanza.investici.org (Postfix) with ESMTP id 4hLT8b41CkzGpB4;
	Thu, 13 Aug 2026 15:01:35 +0000 (UTC)
Received: by mx3.investici.org (Postfix) id 4hLT8Z0l31zGp9V;
	Thu, 13 Aug 2026 15:01:34 +0000 (UTC)
From: Francis Laniel <laniel_francis@privacyrequired.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
 Miguel Ojeda <ojeda@kernel.org>, Benno Lossin <lossin@kernel.org>,
 Gary Guo <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>,
 Boqun Feng <boqun@kernel.org>,
 =?UTF-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, tools@kernel.org
Subject:
 Re: [PATCH v3] rust: pwm: replace `core::mem::zeroed` with `pin_init::zeroed`
Date: Thu, 13 Aug 2026 18:01:33 +0300
Message-ID: <2849575.mvXUDI8C0e@pmachine>
In-Reply-To: <anqsTVj5QGYGiEQ9@monoceros>
References:
 <20260603160910.159307-1-laniel_francis@privacyrequired.com>
 <anqsTVj5QGYGiEQ9@monoceros>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi!

Le mardi 11 ao=C3=BBt 2026, 08:04:49 heure d=E2=80=99=C3=A9t=C3=A9 d=E2=80=
=99Europe de l=E2=80=99Est Uwe Kleine-K=C3=B6nig a =C3=A9crit :
> Hello,
>=20
> On Wed, Jun 03, 2026 at 07:09:09PM +0300, Francis Laniel wrote:
> > All types in `bindings` implement `Zeroable` if they can, so use
> > `pin_init::zeroed` instead of relying on `unsafe` code.
> >=20
> > If this ends up not compiling in the future, something in bindgen or on
> > the C side changed and is most likely incorrect.
> >=20
> > Suggested-by: Benno Lossin <lossin@kernel.org>
> > Link: https://github.com/Rust-for-Linux/linux/issues/1189
> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> > Acked-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > Signed-off-by: Francis Laniel <laniel_francis@privacyrequired.com>
>=20
> Applied to
>=20
> 	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/f=
or-next
>=20
> for the 7.3 merge window.

Thank you for the merge!

>=20
> b4 behaved strange on that patch:
>=20
> 	$ b4 am -s -l -t -3 20260603160910.159307-1-laniel_francis@privacyrequir=
ed.com
> 	Grabbing thread from lore.kernel.org/all/20260603160910.159307-1-laniel_=
francis@privacyrequired.com/t.mbox.gz
> 	Analyzing 2 messages in the thread
> 	Looking for additional code-review trailers on lore.kernel.org
> 	Analyzing 23 code-review messages
> 	Checking attestation on all messages, may take a moment...
> 	---
> 	  =E2=9C=93 [PATCH v3] rust: pwm: replace `core::mem::zeroed` with `pin_=
init::zeroed`
> 	    + Link: https://patch.msgid.link/20260603160910.159307-1-laniel_fran=
cis@privacyrequired.com
> 	    + Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@kernel.org>
> 	  ---
> 	  =E2=9C=93 Signed: DKIM/privacyrequired.com
> 	---
> 	Total patches: 1
> 	---
> 	NOTE: some trailers ignored due to from/email mismatches:
> 	    ! Trailer: Suggested-by: Benno Lossin <lossin@kernel.org>
> 	     Msg From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> 	    ! Trailer: Acked-by: Michal Wilczynski <m.wilczynski@samsung.com>
> 	     Msg From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> 	    ! Trailer: Signed-off-by: Francis Laniel <laniel_francis@privacyrequ=
ired.com>
> 	     Msg From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> 	    ! Trailer: Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> 	     Msg From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> 	NOTE: Rerun with -S to apply them anyway
> 	Preparing fake-am for v3: rust: pwm: replace `core::mem::zeroed` with `p=
in_init::zeroed`
> 	  range: 2707b9df955d..81c3f2b030a1
> 	Preared a fake commit range for 3-way merge (2707b9df955d..81c3f2b030a1)
> 	---
> 	 Link: https://patch.msgid.link/20260603160910.159307-1-laniel_francis@p=
rivacyrequired.com
> 	 Base: applies clean to current tree
> 	       git checkout -b v3_20260603_laniel_francis_privacyrequired_com HE=
AD
> 	       git am -3 ./v3_20260603_laniel_francis_rust_pwm_replace_core_mem_=
zeroed_with_pin_init_zeroed.mbx
>=20
> I didn't research what went wrong there and the trailer made it into the
> patch anyhow and adding -S doesn't change the patch. I added the
> tools@k.o mailing list to Cc:, maybe someone there wants to debug that.
>=20
> Best regards and thanks for your contribution,
> Uwe
>=20

Best regards,



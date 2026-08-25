Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934F63E49C8
	for <tools@linux.kernel.org>; Tue, 25 Aug 2026 21:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693146; cv=none; b=S7HC7RfizBSDIvNvI46H+8Dhel9zQ7BsiVO1oU8q2nl6lxi8vDiWOQ+s4HEjTTsqxjnVoi60qxutQ1l77XbkO4lmE6JxUkP2ZMCFXXq1ALXj0yNot26FXYPw6SDja0BnO0BeS8u2u2WlM8/9a8renNF46WXkOdt+yq1OAKK6ESw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693146; c=relaxed/simple;
	bh=b+z/hVPtH0iq5frKgcleXHoz1ekEHDYbiMk7sVXHCP4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=r+ey6YWMQrzdU4esZWexaQD2EqQ3iXcj72S7QObuJ5e6kc0TEjE0tL0PpVAJ7OCo6/pmdLGHMcAiK/HPpfcDtx7ttWvUcy5NdKM4rWpbJbSX6jHIoJ+xnp1KA8su+jQcqKuHUhg9M5VtV9QG8qWVAGd1oN0XYgQgS7BL6C/Y7eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pzMPZ9hM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pzMPZ9hM"
Received: by smtp.kernel.org (Postfix)
	id 3BFDF1F01569; Tue, 25 Aug 2026 21:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5D81F01566;
	Tue, 25 Aug 2026 21:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787693145;
	bh=2+d9JWGQ0Xu92j5RS92R/m3+oxA1Vy8tCiQeQekd0Gg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=pzMPZ9hMjBtSrmVFmJmjPQLoGkouyaRblmbH0SU3t3FPoUgi04BsSN29VWRd6LtxZ
	 SC74f+3yqtKwh05zqeShzFD9DAZr+cfl5FfwBIxUUwj5ryYIgIJAwFrK5GKlNrO4wa
	 DmWSlAuWRI+SyBJSEkUzpHpxlDNAHVHnCRUBjqEI=
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH b4 3/3] review: add >8< inline marker to snip quoted
 reply context
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: tools@kernel.org
In-Reply-To: <3-v1-5f6173f1d4bf+3e9-trimming_jgg@nvidia.com>
References: <3-v1-5f6173f1d4bf+3e9-trimming_jgg@nvidia.com>
Date: Tue, 25 Aug 2026 21:25:41 +0000
Message-Id: <178769314159.3594992.17501322825534621353.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=825;
 i=konstantin@linuxfoundation.org; h=from:subject:message-id;
 bh=b+z/hVPtH0iq5frKgcleXHoz1ekEHDYbiMk7sVXHCP4=;
 b=owGbwMvMwCW27YjM47CUmTmMp9WSGLL6OMIn6BVOZZyfG+5WnZXTeHfiMq1NgksmFNv/53/3R
 WaL1YXXHaUsDGJcDLJiiixl+2I3BRU+9JBL7zGFmcPKBDKEgYtTACaygJmRoWnOyrAYti8tpzW3
 3bzdJ9p8Y2pT14WWnOJXj+uYJSv19jAynCzgsAx+UDdNReOJ5+uoS3+t3ovWKgqY9Br6LL8o0uL
 MAQA=
X-Developer-Key: i=konstantin@linuxfoundation.org; a=openpgp;
 fpr=DE0E66E32F1FDD0902666B96E63EDCA9329DD07E

> When adding review comments to a message it is very inconvenient to
> permanently loose the quotable text. Often I will make several passes over
> a series and the nice b4 behavior of keeping everything in draft
> encourages coming back and making revisions and further comments.
> 
> However, if the quoted text has been erased that isn't possible.
> 
> Instead of erasing in the editor provide a full line marker '>8<' for b4
> to automagically do the trimming similar to how it trims unused quote at
> the end. Trailing text after user lines and till the marker is removed
> similar to the trailing text.

My only objection is that >8< doesn't say "scissors" to me, it says
"angry bee". How about we equally recognize:

  >--cut--
  >--8<--

-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

Received: from mta1.formilux.org (mta1.formilux.org [51.159.59.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523AEC8F0
	for <tools@linux.kernel.org>; Sat, 11 Oct 2025 06:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.159.59.229
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760163641; cv=none; b=mq14mpSyV8gR7mKBxZ2OTToWJO3uDoekjl1PkfMUdRqDo1SSKaParKnaTKCxnKnxETTNklZB0wMIVQ++tAkOQQaFvWWjE37wlxV8z4+EYmSBEP5nmG7ZLkNwNHEYIMSzaKhPou9quFTGab9TsZdgBdta5YyngX/MUvPZercicOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760163641; c=relaxed/simple;
	bh=s0S4oBeg8bY0i1jNUEQCRrzWWmwlvlIIPveO3Vr1/BQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QH8wFNKAqU+mUN4xumqbb/qP9I2+y7gJ2fwNtX9zLmAqsp+L8CPvXrwE+hJIePfIGaPWadp+MUQUJ+1zwD/jdBvxhh0G++n2EHSIYJ+VZohHOWYrTpDQo5yW9W6gBqigUz5n0tyDaS5TsG0GgDlzQc5VQrD2yJjgAMYUfNJWjos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b=amXbnT+u; arc=none smtp.client-ip=51.159.59.229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=1wt.eu header.i=@1wt.eu header.b="amXbnT+u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1wt.eu; s=mail;
	t=1760163232; bh=s0S4oBeg8bY0i1jNUEQCRrzWWmwlvlIIPveO3Vr1/BQ=;
	h=From:Message-ID:From;
	b=amXbnT+uAATDSuwZiyS5UQkN1fN919B7bv5P/wiW51anv655jlCYYTgqoVil3eB9X
	 +uHTcOLqykEXgtynqSGpCZ4O4BtmaJopxPH6wG2vGfXBalz+oLUyIjes0F1Z/OkUAg
	 9h4z9ZEP8WSeLdFEn/TjiGXpUJ3xR6+GujPHv47k=
Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by mta1.formilux.org (Postfix) with ESMTP id 144DBC06C7;
	Sat, 11 Oct 2025 08:13:52 +0200 (CEST)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 59B6Dpt8023553;
	Sat, 11 Oct 2025 08:13:51 +0200
Date: Sat, 11 Oct 2025 08:13:51 +0200
From: Willy Tarreau <w@1wt.eu>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, users@kernel.org,
        tools@linux.kernel.org
Subject: Re: In defense of Link (was Re: [b4] initial "b4 dig" to supplant
 Link: trailers)
Message-ID: <20251011061351.GB23024@1wt.eu>
References: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABgObfY5agTRsB-bCqCYbA0erFn5cVbujtTNBiCti8g_68nCWg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Oct 11, 2025 at 07:59:32AM +0200, Paolo Bonzini wrote:
> [1] "git am" adding Message-Id predates Link as far as I know. It's
> less handy than a clickable link, but again the known format used by
> git send-email comes to help. I have configured my terminal so that
> "email addresses" starting with "20" open in lore rather than as
> mailto URLs. :))

Maybe what would be needed would be a "Lore" (or "Series" or "Discussion")
trailer that automatically makes a lore link from the message-id, and
which would explicitly indicate that there's nothing else there but the
actual patch submission, contrary to Link that's for any extra info ?
It would be added by "git am" when passed a specific option.

Willy

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D738A930;
	Wed, 23 Jul 2025 19:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753300055; cv=none; b=fQcHQM6gqiCehloAKseubtZaMLZPl4Qu8Fh8qxyG/SKTeSixheW2F+VZXFgISTBKXUMiVGoTwrOkF1zXiDZLLL2TcnlqUTnA90+8Ukm3Zr5AEzzRq7ViPPw8mORap8wmICf2bCFEaUBMtqLVnKQqpCL3Q+Hli26t4pUa0UjlOXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753300055; c=relaxed/simple;
	bh=BKpRNUjBF8s0tv6IAC4jqZvdxpWB5xMf04mf1LRQdYk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dClkcDO290fNaguwO5I+PkaS8oJW20xKYWh8L9yaL9DdKmjMkk1uSqcHqe0Sc/4oZKBqY3PQ9E4Lin7SSoywmpZ1Y/hEvg8ewjm98bk5eYi7JAkuHg5oYNP9F1YKJHw+JFXw8gsvsE6u3GBJEDz/4vAoXZvcpjWEm/1HooHLZ7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=IXN5SH/1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IXN5SH/1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5784C4CEE7;
	Wed, 23 Jul 2025 19:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753300054;
	bh=BKpRNUjBF8s0tv6IAC4jqZvdxpWB5xMf04mf1LRQdYk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IXN5SH/134kCYl91M+2lTqgl3asmThoYuaKcatmcD5TKu2oJ0SNzJMMGvQWhgnFvE
	 +5Tehbrn3QqlAb5B2F9zrf81zgvOJ0mytpbfi/0lh+n6uiUDtpaACaJu3kX5A5Jwhu
	 iVe+yMX4bGZ17Pf2rioDiA5NLKHsiJTLUGVyAdCg=
Date: Wed, 23 Jul 2025 15:47:33 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: users@linux.kernel.org, tools@linux.kernel.org, pisa@fel.cvut.cz, 
	mailhol.vincent@wanadoo.fr
Subject: Re: b4: feature idea: plausibility check for trailers
Message-ID: <20250723-ambrosial-okapi-of-saturation-e85eba@lemur>
References: <20250722-utopian-thankful-warthog-104007-mkl@pengutronix.de>
 <20250722-adventurous-analytic-coyote-72d151-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250722-adventurous-analytic-coyote-72d151-mkl@pengutronix.de>

On Tue, Jul 22, 2025 at 12:17:41PM +0200, Marc Kleine-Budde wrote:
> > |     + Link: https://patch.msgid.link/20250722035352.21807-1-luis.hernandez093@gmail.com
> > |   ---
> > |   ✓ Signed: DKIM/gmail.com
> > | ---
> > | Total patches: 1
> > | ---
> > | NOTE: some trailers ignored due to from/email mismatches:
> > |     ! Trailer: e-mail: pisa@cmp.felk.cvut.cz
> > |      Msg From: Pavel Pisa <pisa@fel.cvut.cz>
> > 
> > ... but ignores it, as it doesn't match the sender's mail.
> 
> Hmmm, b4 says the trailer is ignored, but it ends up in the commit
> anyways.

In this particular case, it's confused by the signature, which has what looks
like a "person-trailer" (e-mail: pisa@cmp.felk.cvut.cz). I've added that to
the exclusion pattern in the latest master.

-K

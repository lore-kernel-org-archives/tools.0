Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A258230505F;
	Tue, 30 Sep 2025 14:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759242862; cv=none; b=f2yYdbRMOgHruyUHIjPzYWZ12KKTeTKxUiUR0YJes2E93yqpyGHkNt2r/HcTg0Mwkt1hJRDtZdvfrC8Ikx2Kk9kLDRijaDjrCY+OPWQZoQmpxzvBq3l9Q9cdiTwT60YmMjmFDHEbjsKUwQbq+cTSwfIMR3kRvAUWh+jTz7vaeyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759242862; c=relaxed/simple;
	bh=0G60ZLNxcFkVY/dPV2Oi8JPPTQW40ORcQbR51NI6OW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQL+1nPnJk+SLBNGE87iVAdeuD1OBL//e/g6nHWAWkaKbKaaPhlXWYZaixwNZND1H6/LwkM7SjVn9uNi6320EqoSSaRWqyrxr4KThgcZevKbojpK7XyWp7+Hw7U2Q6/4XfnQKOPDUk/IKXfSmoCf4HAqRqmqg//4pIUHTZQryzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=P+FFkL6x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P+FFkL6x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 035F2C4CEF0;
	Tue, 30 Sep 2025 14:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1759242862;
	bh=0G60ZLNxcFkVY/dPV2Oi8JPPTQW40ORcQbR51NI6OW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P+FFkL6xPlfeRLUZ6dIEHfSFRXpp6kZUTd8fbPektEHBVmpWtphun62L/QMSAcZFK
	 lSEcHBzUdogOhGKETGl5hE6uzUc57/gBqfeP597dKJ8fdCei0ucwk3nFq0wftOlw0+
	 W56KbDHlSBWJ/2njWCNW6Nxqv3/UaWiGm/t4v+T4=
Date: Tue, 30 Sep 2025 10:34:18 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Rob Herring <robh@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, users@linux.kernel.org, 
	tools@linux.kernel.org, kernel@pengutronix.de
Subject: Re: b4: shazam: UnboundLocalError
Message-ID: <20250930-cunning-fox-of-serenity-b04f29@lemur>
References: <20250930-groovy-soft-octopus-bd626a-mkl@pengutronix.de>
 <CAL_JsqJW5r+5eXqcbdHgwt5dsv9eRYOXO9azOzkMco_LxoMH5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqJW5r+5eXqcbdHgwt5dsv9eRYOXO9azOzkMco_LxoMH5g@mail.gmail.com>

On Tue, Sep 30, 2025 at 08:26:25AM -0500, Rob Herring wrote:
> > | UnboundLocalError: cannot access local variable 'pmsg' where it is not associated with a value
> 
> I sent a fix for this 2.5 months ago:  "mbox: Fix splat in get_series()"

Apologies, I missed that.

-K

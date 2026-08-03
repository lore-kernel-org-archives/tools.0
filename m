Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C188330D40B
	for <tools@linux.kernel.org>; Mon,  3 Aug 2026 14:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766984; cv=none; b=kc9IuDvt9bzjoMq3uzv5M+d76yPyxkO/HXr6lE9TtDUHT8F/LmeehmdkP2k7k3PIkeeHd1m2NKeF5gd6CWDt0d54G2nI1YRYdtZ6EMjCnJLFccmznxyzWEZy2RawvhLPG2H1IF9uwhQRcssloZIVhQwmmv7tFhKquN8seDCBcB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766984; c=relaxed/simple;
	bh=P99/SLbed+NbAXNgFMQ9AHr1eI0ytSjVZhyjqIahJ58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CHU5fa/RV4hLUk6cOuDOBuhmV2hSqwwLadPcS164t0vmCap2x5+wPaJ2FQE15jMJ8fJLFY1TUSbWHCcdBF4lrCaOPs8gpcZW5+Y1xvf3WkZs4tMuSQ8t01DAhUEHwnqBcemQ7JPdaI+6bxB+PQvzsrD7uesVEMQ2ydy/qdwzmjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SoO+T8NO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SoO+T8NO"
Received: by smtp.kernel.org (Postfix)
	id 770921F000E9; Mon,  3 Aug 2026 14:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1409C1F00A3A;
	Mon,  3 Aug 2026 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785766983;
	bh=byZraChaLIMXG3UpGwdk+FoGyrNsCJ7JZTVCzi9Diwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SoO+T8NOhCO2/5EIY3Tk1CpY3kaQbc2eBvQz6hWChGeSzA+Lmozdt1h9TnpVspEGE
	 ETwBMVyeYKDsvJkSOfWUHOBCjHhxwuzUbc54QWz0k5rrh9Q/xfdn9lccRh9SyKjisx
	 xd8Pvk1DJ8SOvw873E1t80Yap/vrsOacI1ZvzJCoMJvZ7QSRIffYkCCWPAjKbPv3Q0
	 Xg1suFZz93zTw4Z76hPmesuHMqwJyXilmG/qYEHC12Jazu4Wx87j2CcJ0ZD8WSTcWC
	 dX8ugttgxpT/XO8hf5DtZfTWOk5B5Z9lgwCx3iZk3Xvgiox9npGS6Gq+uoO/+n0wPt
	 WZXpmJTY9zCvQ==
Date: Mon, 3 Aug 2026 10:23:01 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Tan Siewert <tan@siewert.io>
Cc: tools@kernel.org
Subject: Re: b4 send fails with "no configs found"
Message-ID: <20260803-economic-serious-gharial-17692a@meerkat>
References: <2c6bc94e-29ab-4620-85fe-010b02942040@siewert.io>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2c6bc94e-29ab-4620-85fe-010b02942040@siewert.io>

On Fri, Jul 31, 2026 at 07:50:39PM +0200, Tan Siewert wrote:
> Hi Team,
> 
> I've been trying to use b4 on my personal system and can't send any messages
> via msmtp / my sendemail identities, because it falls back to B4 relay
> although I haven't set anything for that in this regards.

Thanks for the detailed report!

The config isn't failing to load, we just didn't support sendmailCmd, because
it only got introduced in later git versions. So far, we only recognized when
smtpServer was set to a path.

This is now fixed in master -- b4 now honours sendmailCmd with the same
precedence as git itself (it wins over smtpServer when both are set), so if
you pull the latest master, your existing configuration should work as-is,
without any changes.

If you'd rather stay on a release version until this ships, the
workaround is to use smtpserver, e.g:

    git config sendemail.private.smtpserver "$(which msmtp)"

Thanks again for the report and the thorough debugging output.

-K

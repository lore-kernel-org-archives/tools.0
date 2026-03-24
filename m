Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8A533A6E9
	for <tools@linux.kernel.org>; Tue, 24 Mar 2026 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356593; cv=none; b=NgJY4kPOajkfDXqJ9xr2mup9n9fk3eLxKH1qpQNIf8D6JbbGycU6E9aSWaeGjj0NWkeDgBjj8h9dW4KPD+tK5S81DbSZOeKFXwGjomXjpJ7RCKI8F+KX5wHMKiImEvDafuS40uzxEh4fmWZSYpybPbcgyLPWFyxJFOh+PTVtFZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356593; c=relaxed/simple;
	bh=lVuNbFbKXhj8UPJsqHPx4QPPifBh3tTiCpO5EDT8tCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2O4EYK6p6u+7IG9LtvBfcAr9P0zDg1czZrCL8dWSD8nOweJhsv4gH84rxvpUm6xxrMc4+7pLq3x4vCWJWvYHBRMYYGhKdGw8xRFQ90UmOgSLlsJ6M5Q0eaXZo3xpR/el4qxvjjna279bbNYiDJ2NJDUAM9od5iWrw30hXI+f88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ziUy9+jz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ziUy9+jz"
Received: by smtp.kernel.org (Postfix)
	id C3FACC2BCB3; Tue, 24 Mar 2026 12:49:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BF8C19424;
	Tue, 24 Mar 2026 12:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774356592;
	bh=lVuNbFbKXhj8UPJsqHPx4QPPifBh3tTiCpO5EDT8tCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ziUy9+jzBNu49qNA6twZyWp89BZjymbVDTMuGeB1Al2iboQAl+QFtD3gP9LjA0+TI
	 paGL5gR08kfe4p8RKi8dlDcB5z1kXCUct6w4YpjMEmqC64pFAm2e3x1rHEtYwreF0Z
	 bQ93jZXP32XVEHEXm7boUgumo3s+Byv2/KumXUsg=
Date: Tue, 24 Mar 2026 08:49:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Jiri Slaby <jirislaby@kernel.org>
Cc: users@kernel.org, tools@kernel.org
Subject: Re: b4 v0.15.0 released
Message-ID: <20260324-complex-monumental-mamba-1e57ce@lemur>
References: <20260320-portable-jaybird-of-focus-41fd66@lemur>
 <2c35a708-0ff6-4fe0-8974-2e786dadff6e@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2c35a708-0ff6-4fe0-8974-2e786dadff6e@kernel.org>

On Tue, Mar 24, 2026 at 08:26:15AM +0100, Jiri Slaby wrote:
> On 20. 03. 26, 21:47, Konstantin Ryabitsev wrote:
> > Hi, all:
> > 
> > B4 v0.15.0 is now available! Install or upgrade using your usual mechanism.
> 
> Hi,
> 
> the TUI tests fail for me (while packaging for openSUSE):

Ack, that's true, I never tried running them outside the git repo. I'll check
it out and cut 0.15.1 when fixed.

bugspray tag b4/tests

-- 
KR

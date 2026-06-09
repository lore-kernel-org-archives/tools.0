Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5722840D570
	for <tools@linux.kernel.org>; Tue,  9 Jun 2026 21:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781042192; cv=none; b=JvC232vek6OQTmvIL7er6cOjSjXCTCXSN6e8gzyoU8e/kf4qLj2sjY60xy/bZNlvkMALA90UNwWLh5BPRIylJi8hhJJx8B2QN+G5M8Jp9G6EUDQ+vCJtmaBrlkB3rBLXG61uu53AofMutJqgYQXrcNlOUIcNU3KOPo9I9vUR73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781042192; c=relaxed/simple;
	bh=4iatdAaI+3sNHNKmbs2bRE3AkJTlg8X06TNgp8Ck9h0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NoVD0W0CmBly4MJOjPoqWe5LnAe1IEU8EpjFHEPrcDNAOR9GUs6aIlag+aj9cik/mmU96EHHGGYh/NrP8iMZG9Du9THfNSzo5Ky9UCp2AdkjnO5S8l2gYJ58Pg9qqrwNtHT2P/IqEskXNGo0fYN05Fh1316vl+YJ034iH9xDnu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=doqc/Jcs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="doqc/Jcs"
Received: by smtp.kernel.org (Postfix)
	id 1559E1F00898; Tue,  9 Jun 2026 21:56:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26171F00893;
	Tue,  9 Jun 2026 21:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781042191;
	bh=Eyhq+3OUEiyA+oW8d+Kad9gVNdv8Yi4IdMi3mc7PHn4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=doqc/JcsV/Y34VgwVB7ZyQD1eoxlQyhVLEknSR+oMonflqTC0h5HSLq9mf0PkdkIS
	 Isai/uOHtD3YH/I5GwfoHK+GkifNfkOrFAG6rgNGo5aj9pyJLVorSnvxrY3XtX8Spu
	 zgOUs6JY2ruVG8gMe9Ce6kHh3tpdCVt+GCjTbufs=
Date: Tue, 9 Jun 2026 17:56:29 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Subject: Re: [PATCH b4] Avoid expiring snooze test data
Message-ID: <20260609-statuesque-famous-duck-45a7aa@meerkat>
References: <20260605-date-expiry-test-v1-1-972c2589973d@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260605-date-expiry-test-v1-1-972c2589973d@kernel.org>

On Fri, Jun 05, 2026 at 08:42:22AM -0400, Tamir Duberstein wrote:
> The tracking TUI test used a fixed snooze date that eventually passed,
> causing startup to correctly wake the series and clear snoozed_until.
> 
> Generate a future timestamp relative to the test run so the test
> continues to exercise loading an active snooze from the database.

Taken, thanks! But I messed up my tracking in the process, so here's a manual
thanks. :)

-K

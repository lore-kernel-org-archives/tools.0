Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF204340DB9
	for <tools@linux.kernel.org>; Tue, 17 Mar 2026 21:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773781432; cv=none; b=SE8cCfhx503fLeb1BnYZLGx8jYraMO/evFbi7FPE4n8rCXr6jZ+Tujg9JLotty/4YAncToAePDMlWi4M35jLbnPo7MDQCNz4Va+8RT7KcWiL6thhdJErmrqDSK21N9A121ZYBLZtslWTn1wAq/b2rXgWbmZ0bB2dsVLgruWjPuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773781432; c=relaxed/simple;
	bh=CI7DY23dRmkVZjgDjdkI8Mm70KCHhkjBjIL8yo17zEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BDpPUiiyD//gWjC2FrKnM0GG0Y4R286AbzYVMwyPkJsnCjCxiPUBR7K5pe3mW3Vd39h3NJp3Yclce3ycm9i1CIRvVCV8l9tuhNlXZ3ZOfOpvhVgCqZO162nqpIhwk3Put/FcQbJAJk4MOoV80O/NvDxQGzS9uBcJVcXKVMmEb8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KS15CpKM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KS15CpKM"
Received: by smtp.kernel.org (Postfix)
	id 85C66C4CEF7; Tue, 17 Mar 2026 21:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4474FC19425;
	Tue, 17 Mar 2026 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773781432;
	bh=CI7DY23dRmkVZjgDjdkI8Mm70KCHhkjBjIL8yo17zEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KS15CpKMNu7CnzU+U/dWL6QNNfd5EI7KYcq1zbfGEufcNWmnRZz85C8yonJIVWVl9
	 4pmwY4x+KYn088UrGw2NayNrfNwLDA7gYcQYHDX68Bd8vh1YN0HP+7PHCRI5avrhjB
	 OUl/LiB6z/C/+Vo31mUBARfEtlEgY/o6EBMTidCV5S1Xm5e7GEu1hxMhCTQL6w+PPz
	 xzSiiLtQxCUao2lKlqzwVXCOMOFv5jireteAeEVDZHU8Ff/pYi6hG+xOzM5z3Um3HK
	 MEapLPJ82F8A/pvzsQSQjcz7LNQhlaf5aYYWEMYjALlN6psd3srN6r8Mgh2xrNLSs1
	 O7Iw+z5ZNVK7A==
Date: Tue, 17 Mar 2026 17:03:51 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools@kernel.org
Subject: Re: Sorting for applied and thanked reviews
Message-ID: <20260317-enigmatic-acrid-corgi-e9bee9@lemur>
References: <4547f513-9e28-4f5c-93d1-823e70b110fc@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4547f513-9e28-4f5c-93d1-823e70b110fc@sirena.org.uk>

On Tue, Mar 17, 2026 at 07:22:03PM +0000, Mark Brown wrote:
> Currently it looks like in progress, applied and thanked reviews are all
> sorted together (by activity I think?), with reviews that are snoozed or
> waiting for new versions sorted after them.  This seems a bit
> surprising, I'd expect at least the thanked reviews to be sorted even
> further down the list than those that are in progress but waiting for
> something.

We currently split all your tracked series into "action required" ones at the
top and "action not required" ones at the bottom, which is why all your
snoozed and waiting series are below everything else. Within these two
sections, the series are sorted by when they were last added to your tracking,
not by most recent activity. I used to sort them by latest activity but I
hated that they jump around -- if you have 5 series that you're working on
throughout the day, you benefit from visual memory if they all sit in one
spot.

I was expecting that "thanked" series would be prime candidates for archiving,
which is why they are kept in "action required". However, it's an easy change
to add them into "no action required".

We can instead differentiate this into:

active:

    - new
    - reviewing

action required:

    - replied
    - accepted
    - thanked

inactive:

    - snoozed
    - waiting

Does that work, and how would you sort these?

-- 
KR

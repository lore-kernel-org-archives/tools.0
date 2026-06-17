Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FAB3F8EB3
	for <tools@linux.kernel.org>; Wed, 17 Jun 2026 21:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781731050; cv=none; b=ubpakq5I/CIhy/bT0qR0q2qx59fr/aY94i+EsVqJYavQpYchVJZRjRkUql3LFzX9C3Sf5+wr6FngANjY4tgBnXswjiCi8Qbp/RVIIzlLPK8cMHy81C2aADB7VF8TbBoNqgzawqt7Lm6My4H4E/8TEKHOmE77BhsjroM05d3YqrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781731050; c=relaxed/simple;
	bh=Yk4tVq1lrzxdZFUAaVqyEbKzTOwr8HRt8IUxIX7FNwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqECmR5tgme5w//tTf5O7rznb8z3xJLatcFHvCRRna/cRKGq7ViX+co+RX40yGrjEWLKJWJp7b6BXJbd650cypheATNqDX0xMYbDOXhlM64oHSlOXhoYZIbxUeTcGOT61ddaSrix7xRP3KZt67AK+sIxt1RSRSAP8QxItETKWsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AoS0ZkOv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AoS0ZkOv"
Received: by smtp.kernel.org (Postfix)
	id ED6EE1F00A3A; Wed, 17 Jun 2026 21:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6FE91F000E9;
	Wed, 17 Jun 2026 21:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781731048;
	bh=6keK19PIn/cdnFgvrvyEhKeTqBGzwzaVBOon4weB2dA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AoS0ZkOvtR6JUAbDXuZDIZFNMYO1AJr5skK3NZmNL3qQIKr6zxOKbhfxE4Ak1uXF0
	 J3tDloEdoqoA+eR1eZlIOIbGLWi4jN1iJhy9fCX/aQO6CO8MIhE4O4NLvY/ctI/XfC
	 xeEnqfzLvoVtU0qGjrgZSFLCeOPy62pR24BR7e+BiIbbE4Y1XMAmLzK5Wq7QsEY8qc
	 OjY1BIljUqKUdMOKdCESkMoRgDNQvcVvNQy44msmR/f7ADd0cNITFsRrQaKzmZrNXa
	 dFnYypt3Wqc72gMwIROpTFX8PpuY9m/uh1iTDsLEqmWuSt6Mkl1NAgYqPxB0Ulox6m
	 6bmnm3bBnJNjA==
Date: Wed, 17 Jun 2026 17:17:27 -0400
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Dave Marquardt <davemarq@linux.ibm.com>
Cc: tools@kernel.org, Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [Tyrel Datwyler] Re: [PATCH v2 6/7] ibmvfc: register and use
 asynchronous sub-queue
Message-ID: <20260617-true-spiked-wallaby-4834ad@meerkat>
References: <87h5n3o69j.fsf@linux.ibm.com>
 <20260615-smiling-kelpie-of-temperance-4dd61b@meerkat>
 <87cxxqodez.fsf@linux.ibm.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87cxxqodez.fsf@linux.ibm.com>

On Tue, Jun 16, 2026 at 07:52:36AM -0500, Dave Marquardt wrote:
> > You can either manually run all commits with -s (which is what I do), or you
> > can set up a hook to do that for you automatically -- but since it's supposed
> > to be a deliberate action by the committer, I recommend just always
> > remembering to add that little "-s" after "git commit".
> 
> Thanks. I searched and searched the b4 documentation, and now, from your
> explanation, understand why I don't see anything about Signed-off-by:
> when submitting a patch series. Would it be worth adding something to
> the manual? (Yes, if so, I'm volunteering :) )
 
I don't think so. The Signed-off-by: is common, but not at all a requirement,
and since enabling/adding it must be a deliberate and well-understood decision
by the commit author, I don't think it belongs in b4.

I know we can spell it out in the b4 docs, but I don't know if people are
going to be more likely to read them as opposed to the actual kernel
documentation.

-K

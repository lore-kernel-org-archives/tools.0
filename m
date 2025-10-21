Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66EE2EA75C
	for <tools@linux.kernel.org>; Tue, 21 Oct 2025 11:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761045934; cv=none; b=gKB9A0u06t5Pwjumqa076OO6soj929j5uMATrDGsaQRXMEkloOgJLhnIeLEonDIrGGspiA5Fybo1QZlcK1qOWlyPY6CstriwWcldmQfRq0bGW0PyE3FMQcPVcHsBlT3URbbOevEZ77s/p3h777A9NVbiJTnzRh3aAx3BXNl/TOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761045934; c=relaxed/simple;
	bh=o4ASKWF+pLWMy/e3y3FyO07b3bFCcSZu10t5LafXjN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eYx74UNw5EaUs++YZkQ4E8tRYRshNeDSdYS8FsttlOWNX89sYX68+tCltm0lBzmMMCdP3DgVth827oFszwd0h5VjKV8JDoNXJLGaQyraX+Pph5Va8tGCpkagtGt7cL6Iw7ZM74EJDWsFIpmZfsntO+UykHnsP80935yed7lSHYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uz9NvFp6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uz9NvFp6"
Received: by smtp.kernel.org (Postfix)
	id 97CCEC4CEF5; Tue, 21 Oct 2025 11:25:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C646C4CEF1;
	Tue, 21 Oct 2025 11:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761045933;
	bh=o4ASKWF+pLWMy/e3y3FyO07b3bFCcSZu10t5LafXjN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uz9NvFp6V1JrMXY4Z7I3sKFtmo0+c8g4UJ25R3qmI8hKD/Wi0YYKwtGVTesG/YE+0
	 HbVVG/GvMozatm5axbvJ+EVnbHkpyVaJ+q+SQT1oXC50Y2+u21Sy/vHBtdMxRcknEc
	 HBKeHCfFPjl3sf0U329t7E9uuNag5kUPTQJzaZ3x8JZ/8wwFknJ0VqCYvksmN9ahw1
	 xRMvcg29mYiJB8A36Bqbit6gjzd7fi6APSohxv4J21HKzYj/osfrIaNoffbgxQLiVh
	 7m8ZODz7+37hhvi7ZLC1x40Wr7ozf54yniXSfp7aAWEsUuxZ137V2S9XiBSPvT3FiM
	 G/FIBQ1xN4P2g==
Message-ID: <08cb2b99-187e-46e5-8921-bbadd2a66636@kernel.org>
Date: Tue, 21 Oct 2025 13:25:30 +0200
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: b4: ty: User-flow regression
Content-Language: en-US
To: Lee Jones <lee@kernel.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, tools@kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20251009151349.GB2890766@google.com>
 <20251009-remarkable-charming-pogona-fd7a8f@lemur>
 <20251010080324.GC2988639@google.com>
 <20251010-mauve-dolphin-of-apotheosis-a1cbdf@lemur>
 <20251010143452.GH2988639@google.com>
 <20251010-feathered-pastoral-woodpecker-de863d@lemur>
 <2025101155-coauthor-backboned-e90b@gregkh>
 <20251021105645.GE475031@google.com>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <20251021105645.GE475031@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/21/25 12:56, Lee Jones wrote:
> On Sat, 11 Oct 2025, Greg KH wrote:
> 
>> On Fri, Oct 10, 2025 at 10:37:22AM -0400, Konstantin Ryabitsev wrote:
>> > On Fri, Oct 10, 2025 at 03:34:52PM +0100, Lee Jones wrote:
>> > > > Next question is -- have you recently stopped adding Link: tags to your
>> > > > commits? :)
>> > > 
>> > > Oooo, yes!  Yes, I have!
>> > > 
>> > > Why would that make a difference?
>> > 
>> > When patches have been altered by the maintainer, we can no longer match them
>> > by git-patch-id.
>> 
>> Which is the primary reason to keep the Link: stuff.  Many maintainers
>> manually change patches to fix up minor things all the time, and without
>> the Link: it's a major pain to find (the LF sponsored a whole project
>> just to do the backwards mapping for many years, but no one used it...)
>> 
>> > In the past, when we found a Link: trailer, we could still
>> > match their provenance by message-id, but if that is gone, we can no longer
>> > fall back to that. I am working on making the "ty" mechanism being less
>> > dependent on that -- hopefully the master branch should become more useful to
>> > you again in the near future.
>> 
>> message-id is important to track somehow, we need that link.
> 
> It turns out that going back to manually thanking contributors is too
> much of a regression for me ATM.  For now at least, against Linus'
> wishes (sadly), I'm putting Link:s back in.
 
Linus later said he would tolerate them with the https://patch.msgid.link
domain:

https://lore.kernel.org/all/CAHk-=wj5MATvT-FR8qNpXuuBGiJdjY1kRfhtzuyBSpTKR+=Vtw@mail.gmail.com/

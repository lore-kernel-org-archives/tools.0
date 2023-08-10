Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638F91E1D2
	for <tools@linux.kernel.org>; Thu, 10 Aug 2023 16:02:12 +0000 (UTC)
Received: from cwcc.thunk.org (pool-173-48-112-65.bstnma.fios.verizon.net [173.48.112.65])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 37AG1q0Q030767
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 12:01:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
	t=1691683314; bh=rD724fSSexNAtLAwTBj5GC0Srk6wDTCwff8Hnm4ZRXw=;
	h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
	b=YRLvoSttR80p2QSVJcS/Alz9SbFDmj85v8cV00bxzw7Xzr68StZZICNTuME8ri9et
	 PGAt/GFzw6gyK6Wye7/7kOh3tPZ9YRlIhJ6rTrEMZ7UxLWyzTEFQR0bZBwQFOFxD8D
	 UEHsbkrW2OroeIwJgbBWsFyAIqXO2yTGPi1kVg3wRZ1ZsmdPkBjeT7pOg+1klqf6HI
	 eScDo1osg1sKx40VRNfM4FJpwJN7Pfis7eVoDLXF39zaNFxon1SjeP0UeVjpIrlCT6
	 CciNq1wlhRInOn07x4jXXTl5OJKEOOiC4IE3pzSCX78fQw+4o20Ducx65ZwqKz3kLa
	 qsJe+WUQXkRpg==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 8705C15C04FF; Thu, 10 Aug 2023 12:01:52 -0400 (EDT)
Date: Thu, 10 Aug 2023 12:01:52 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Mark Brown <broonie@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Joe Perches <joe@perches.com>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        "Kernel.org Tools" <tools@linux.kernel.org>,
        "# 3.4.x" <stable@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: get_maintainer, b4, and CC: stable
Message-ID: <20230810160152.GA2247938@mit.edu>
References: <CAKwvOdmOVnhKws_6DdakK9SDxiCCCR1d6VJwvz94Ng_y3V8QCg@mail.gmail.com>
 <6dabeab8-d013-40fc-a705-d2d202510549@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6dabeab8-d013-40fc-a705-d2d202510549@sirena.org.uk>

On Wed, Aug 09, 2023 at 06:21:51PM +0100, Mark Brown wrote:
> On Wed, Aug 09, 2023 at 09:50:00AM -0700, Nick Desaulniers wrote:
> 
> > I suspect that either b4 or get_maintainer could see the Fixes tag and
> > then suggest to Cc stable for me.
> 
> > Should get_maintainer.pl make such recommendations?
> 
> People use the Fixes tag all the time for bugs that never made it into a
> release...

I agree that it probably shouldn't.

Sometimes the bug was introduced by a commit that didn't have a Cc:
stable@kernel.org, but it gets automatically pulled into a LTS kernel
due to dependency reasons, or otherwise gets auto-selected into an LTS
kernel.  So I try to add Fixes tags even for bugs that never make it
into the stable kernel --- but that doesn't mean that it should
automatically get a cc stable tag.

(Of course, it might be that the AUTOSEL process will automatically
pull in such commit, and then pull in something probably should not
been pulled into a stable tree, but this is why XFS has stable
backports maintainers --- because they don't trust the LTS automation.
For ext4, we probably see one of those sorts of the auto-backports
caused a regression maybe once a year?  But that's a different
debate.)

	    	    	       	 	     - Ted

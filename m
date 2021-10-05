Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7371A6D18;
	Tue,  5 Oct 2021 13:29:02 +0000 (UTC)
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net [72.74.133.215])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 195DPqZL027716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Oct 2021 09:25:53 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 8B36915C34DF; Tue,  5 Oct 2021 09:25:52 -0400 (EDT)
Date: Tue, 5 Oct 2021 09:25:52 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Mark Brown <broonie@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Acked-by missed when applying
Message-ID: <YVxSYIptCkSZF084@mit.edu>
References: <CAF2Aj3icJtU+wacosM-LO2aqMChWL69T6bf7dK3xqPMSk6Ux3w@mail.gmail.com>
 <CAL_JsqKdfMBfrFgu6bmj1HLhwwNFAErj-_dMSizX+dZ0h_B47g@mail.gmail.com>
 <20211005124536.ynz4ps5etrppfqxi@meerkat.local>
 <YVxJ2Q21vstxIDsX@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YVxJ2Q21vstxIDsX@sirena.org.uk>

On Tue, Oct 05, 2021 at 01:49:29PM +0100, Mark Brown wrote:
> On Tue, Oct 05, 2021 at 08:45:36AM -0400, Konstantin Ryabitsev wrote:
> > On Tue, Oct 05, 2021 at 07:22:00AM -0500, Rob Herring wrote:
> 
> > > Because you applied the first v2 patch, not the second v2 threaded to
> > > the 1st one that Greg acked.
> 
> > Should we issue a warning in such cases? E.g:
> 
> > WARNING: Identically numbered patches found, will use the latest by date.
> >          Download and edit the mailbox manually for any other outcome.
> 
> Please!  In general the messages b4 prints when it resolves any
> ambiguity are really helpful.

+1.  If b4 could give us the message id's and message time stamps,
that would be great.  Even better, perhaps b4 could download both, and
diff the two patches, which might give us some clue if it was just the
same patch accidentally sent twice, or change in the commit
description (maybe the sender forgot to add some trailers?), or the
commit diffs are actually different, in which case maybe the sender
forgot to increment the version number.

						- Ted


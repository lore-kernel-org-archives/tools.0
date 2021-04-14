Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7FC6D28;
	Wed, 14 Apr 2021 14:46:51 +0000 (UTC)
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net [72.74.133.215])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 13EEi0Wd003049
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Apr 2021 10:44:01 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 99F2015C3B35; Wed, 14 Apr 2021 10:44:00 -0400 (EDT)
Date: Wed, 14 Apr 2021 10:44:00 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>, Alex Elder <elder@ieee.org>,
        users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: RFC: Superseded-by: follow-up trailer
Message-ID: <YHb/sM95npXrwKPJ@mit.edu>
References: <20210413204932.yovoa7njwc56jo5v@nitro.local>
 <fd732fc9-83a9-5502-fba5-f08317bdcaf3@ieee.org>
 <CAHmME9pFqm00ibpqhQQ9_P61F7mU12yrcOvdNSDYDz8ot8HJDg@mail.gmail.com>
 <20210413172901.1465307c@gandalf.local.home>
 <20210413214031.fenjvgh5helyuqdz@nitro.local>
 <YHaaMaa2uaa6HM9c@hirez.programming.kicks-ass.net>
 <20210414114950.GM227011@ziepe.ca>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210414114950.GM227011@ziepe.ca>

On Wed, Apr 14, 2021 at 08:49:50AM -0300, Jason Gunthorpe wrote:
> 
> v3:
>   - blah blah
> v2: https://lore.kernel.org/r/foo
>   - blah blah
> v1: https://lore.kernel.org/r/bar

> b4 does a nice job helping the maintainer, but the submitter has no
> helpful common tooling currently.

It would be nice (and I think possible) if finding the mapping between
v1 and https://lore.kernel.org/r/bar could be automated --- and if we
had an appropriate hook in git send-email, it should be possible to
capture the message-id and stash it in a state file somewhere so the
developer could either fetch it manually, or if we had something like
debian's "debchange" command to make it easy to compose the changelog,
it could fetch it and stash it into the template file before opening
up an editor for the developer to update the changelog.

What do folks think?

				- Ted

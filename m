Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8FF72;
	Thu,  9 Sep 2021 14:38:40 +0000 (UTC)
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net [72.74.133.215])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 189EXUAT018875
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Sep 2021 10:33:31 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
	id 7CB5715C33EC; Thu,  9 Sep 2021 10:33:30 -0400 (EDT)
Date: Thu, 9 Sep 2021 10:33:30 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        David Howells <dhowells@redhat.com>, users@linux.kernel.org,
        tools@linux.kernel.org
Subject: Re: lore.kernel.org upgrade: Sep 1, 2021
Message-ID: <YTobOk4+cUkHWvc6@mit.edu>
References: <20210830164626.tq5emfrht4o46x33@nitro.local>
 <398626.1631181532@warthog.procyon.org.uk>
 <20210909123150.fgo7vma4i32t36mg@meerkat.local>
 <CAMuHMdUufV8dNWuqwDa5oAt0k9KiJB06W7xLAR8=phWVWmp0wg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUufV8dNWuqwDa5oAt0k9KiJB06W7xLAR8=phWVWmp0wg@mail.gmail.com>

On Thu, Sep 09, 2021 at 03:21:52PM +0200, Geert Uytterhoeven wrote:
> 
> And if you make it the default search engine, you can select "Show
> original" in Gmail, select the Message-ID, and right-click to
> search. No more copy-and-paste needed.
> 
> Unfortunately that means right-click to search for other topics doesn't
> work anymore. Perhaps lore can redirect to Google if no results were
> found? ;-)

That would mean that lore would have access to a large part of your
search stream.  Some might consider it to be privacy concern, unless
the LF wants to introduce a privacy policy promising they won't try to
monetize that as an income stream?  :-)

						- Ted

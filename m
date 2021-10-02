Received: from 1wt.eu (wtarreau.pck.nerim.net [62.212.114.60])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 054C23FDE;
	Sat,  2 Oct 2021 06:28:37 +0000 (UTC)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 1926MkOH030741;
	Sat, 2 Oct 2021 08:22:46 +0200
Date: Sat, 2 Oct 2021 08:22:46 +0200
From: Willy Tarreau <w@1wt.eu>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Kees Cook <keescook@chromium.org>, tools@linux.kernel.org,
        users@linux.kernel.org
Subject: Re: merging pull requests
Message-ID: <20211002062246.GB30200@1wt.eu>
References: <202109301023.B78ABE54B@keescook>
 <20210930200002.67vxbowvegso2zhg@meerkat.local>
 <202109301559.A9BFB03@keescook>
 <20211001182615.bcyuag7vfrkzhefj@meerkat.local>
 <CAHk-=whZMDmgs3+djfUoVrx8jj7DwGOJvLWC=vw1dCMicqHJ1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whZMDmgs3+djfUoVrx8jj7DwGOJvLWC=vw1dCMicqHJ1g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Fri, Oct 01, 2021 at 11:47:12AM -0700, Linus Torvalds wrote:
> The "why" is
> often very important for a merge, even if you'll sendom see it in my
> merges where the "why" is kind of implicit.

FWIW I'm facing the same difficulty in other projects where I feel like
I always have to explain this again and again, but when re-reading my
own messages later I notice I'm often not better than others at this
exercise.

This led me to try to understand why I was not doing well what I'm
expecting others to do, and to realize that when developers finish a
series they've been working on for some time, the "why" is so much
obvious to them that it's difficult to write a good justification
for it, as what is non-obvious to others becomes hard to grasp. The
advices I give which seldom work are:

  - try to *sell* me your series. You want me to adopt them and be
    responsible for them, OK but you have to convince me to do so.

  - explain what we'd lose or break in case we'd later need to revert
    the series. Very often this is the direct response to the "why".

The two are more or less equivalent but are different approaches to
the problem, depending on the context or the nature of the changes.
With a bit of practice it can sometimes be as simple as "this is
the preliminary changes required for X that extend the API using
wrappers to temporarily maintain the compatibility with the previous
one", or stuff like that.

Willy

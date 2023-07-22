Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392B9366;
	Sat, 22 Jul 2023 18:55:13 +0000 (UTC)
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 36MIl9Sn017953;
	Sat, 22 Jul 2023 20:47:09 +0200
Date: Sat, 22 Jul 2023 20:47:09 +0200
From: Willy Tarreau <w@1wt.eu>
To: Maxime Ripard <mripard@redhat.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: Fetching an mbox from lore
Message-ID: <20230722184709.GA17936@1wt.eu>
References: <7pcrdb6rgkmnfk5nukr4q7brpdmzrjon5zjmc66r2xvqan7kyc@oe3ip5kmtuiy>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7pcrdb6rgkmnfk5nukr4q7brpdmzrjon5zjmc66r2xvqan7kyc@oe3ip5kmtuiy>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Maxime,

On Sat, Jul 22, 2023 at 07:12:33PM +0200, Maxime Ripard wrote:
> Hi,
> 
> I've been trying to fetch an mbox from lore with an arbitrary search request.
> 
> I could fetch it fine using curl with the following example:
> 
> curl -XPOST -H "Content-Length:0" -OJ "http://lore.kernel.org/linux-clk/?q=d:1.week.ago..&x=m"
> 
> This returns a gzip'd mbox, everything's fine.

Note that when I do this I get redirected to the https URL and when I
use it, then it works.

> def try_url_redirect(url):
>     headers={"Content-Length": "0"}
>     params={"q": "d:1.week.ago..", "x": "m"}
> 
>     s = Session()
> 
>     req = Request('POST', url, headers=headers, params=params)
>     p = req.prepare()

I don't know about this part in python, but are you certain that
it's not trying to pass the params in the request body ? It would
seem natural to me since you've asked for a POST. In your curl
request, you're not sending arguments as part of the body but as
a query string with an empty body.

It would be useful to strace the output (use http:// to make it
easier) to verify, because I really don't trust the debugging
output which possibly just reassembles the URL as if it were a
GET except that it's not that. With curl (in HTTP) it's what the
request says at least:

   20:43:22.246844 sendto(5, "POST /linux-clk/?q=d:1.week.ago..&x=m HTTP/1.1\r\nHost: lore.kernel.org\r\nUser-Agent: curl/7.81.0\r\nAccept: */*\r\nContent-Length:0\r\n\r\n", 129, MSG_NOSIGNAL, NULL, 0) = 129

You should try to concatenate your arguments just at the end of
the URL and really send nothing with the POST.

Hoping this helps a little bit,
Willy

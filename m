Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
 by mx.groups.io with SMTP id smtpd.web12.57.1588164564791767087
 for <tools@linux.kernel.org>;
 Wed, 29 Apr 2020 05:49:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: ucw.cz, ip: 46.255.230.98, mailfrom: pavel@ucw.cz)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id AD3CF1C0208; Wed, 29 Apr 2020 14:49:04 +0200 (CEST)
Date: Wed, 29 Apr 2020 14:49:04 +0200
From: "Pavel Machek" <pavel@ucw.cz>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: [kernel.org users] What is a useful way to show changes between series?
Message-ID: <20200429124904.GA3098@duo.ucw.cz>
References: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
MIME-Version: 1.0
In-Reply-To: <20200428192938.aue3v6kxsm47day5@chatter.i7.local>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Groupsio-MsgNum: 117
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FL5UXtIhxfXey3p5"
Content-Disposition: inline

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue 2020-04-28 15:29:38, Konstantin Ryabitsev wrote:
> Hi, all:
>=20
> What would be a useful way to quickly do a "show me what changed"=20
> between two versions of the same patch series? Especially considering=20
> that:
>=20
> - there may be a different number of patches in the series
> - new revisions will likely be based on newer trees
> - subjects/commit messages/trailers may be vastly different between two=
=20
>   series, even if the code is very similar (e.g. someone broke down a=20
>   single large commit into several smaller ones or vice-versa)
>=20
> In my mind, the best way to approach this would be:
>=20
> 1. Create a single unified diff file from all patches in each series=20
>    (using combinediff)
> 2. Remove all context, leaving only -/+ lines (using interdiff -U0)
> 3. Remove all line numbers from @@ @@ hunks (replacing them with 0)
> 4. Add commit information on top of the diff

You know about interdiff utility, do you?


--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--FL5UXtIhxfXey3p5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCXql3wAAKCRAw5/Bqldv6
8qGDAJ9pzrrtjbThLhr6FLGaTEWPqa0R4gCfRrTtYGKUNHiozzuW+TGDL/wN3GI=
=a9a0
-----END PGP SIGNATURE-----

--FL5UXtIhxfXey3p5--

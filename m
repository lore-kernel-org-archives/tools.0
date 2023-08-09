Received: from relay.hostedemail.com (smtprelay0014.hostedemail.com [216.40.44.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D12E634
	for <tools@linux.kernel.org>; Thu, 10 Aug 2023 01:09:15 +0000 (UTC)
Received: from omf11.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id 3033540F39;
	Wed,  9 Aug 2023 21:32:37 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf11.hostedemail.com (Postfix) with ESMTPA id C7B7D2002F;
	Wed,  9 Aug 2023 21:32:33 +0000 (UTC)
Message-ID: <1f4f00799730ae53da67b48b0f4aea60e0d81a45.camel@perches.com>
Subject: Re: get_maintainer, b4, and CC: stable
From: Joe Perches <joe@perches.com>
To: Mark Brown <broonie@kernel.org>, Nick Desaulniers
 <ndesaulniers@google.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, "Kernel.org
 Tools" <tools@linux.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>
Date: Wed, 09 Aug 2023 14:32:32 -0700
In-Reply-To: <6dabeab8-d013-40fc-a705-d2d202510549@sirena.org.uk>
References: 
	<CAKwvOdmOVnhKws_6DdakK9SDxiCCCR1d6VJwvz94Ng_y3V8QCg@mail.gmail.com>
	 <6dabeab8-d013-40fc-a705-d2d202510549@sirena.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Stat-Signature: ros5iojdmbs9dhgybjpbuc41qbwrdh5y
X-Rspamd-Server: rspamout04
X-Spam-Status: No, score=-0.94
X-Rspamd-Queue-Id: C7B7D2002F
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/GAX33WtLekNY3FtCoxzml/9XOuULYUJE=
X-HE-Tag: 1691616753-354429
X-HE-Meta: U2FsdGVkX1/dCbVfGFSPqx//Rs2O0b1z173ZDQr6AYLThdF8udEXg2MKFpG7QHhaDhAYncYOevebJmKtDuZYE5WM34t+swqtc430QBMaWYriEWsJhaRudjHJMupOOEHGHFYbZUBm38xw5i3nwzfwydHHH69kpqmCTULizTEy1rn4N/HufGb/g80uW12EEY/QZvqPhIvpuGhpWDdPu+VLPBjtYZB3ZVB6cg2XZ72rwu6AuisN1kxb1qrOWNS/wxN4FFBMyuzf7mFbKpOk3zlygsaRky4QuiDpzqqh4+FBZvlyJRyzK1a4TLs3GQ6Ue888

On Wed, 2023-08-09 at 18:21 +0100, Mark Brown wrote:
> On Wed, Aug 09, 2023 at 09:50:00AM -0700, Nick Desaulniers wrote:
>=20
> > I suspect that either b4 or get_maintainer could see the Fixes tag and
> > then suggest to Cc stable for me.
>=20
> > Should get_maintainer.pl make such recommendations?
>=20
> People use the Fixes tag all the time for bugs that never made it into a
> release...


As Nick suggests, likely not.  Many fixes do
not belong in stable and are only commits
that update the current rc.

get_maintainer checks the "fixes:" tag and
cc's the signers of the commit being fixed.


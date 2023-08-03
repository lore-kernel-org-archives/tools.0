Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BA92591C
	for <tools@linux.kernel.org>; Thu,  3 Aug 2023 20:58:33 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-63d10da0f26so8867006d6.3
        for <tools@linux.kernel.org>; Thu, 03 Aug 2023 13:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691096312; x=1691701112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZFjxlkqEQE8VVVjXcIIbMGH3aHeupBGM7OL/6U2R9w=;
        b=jImlr2K4WQkqxLlQ2IsmDFTgdvhajJMStEaQ66B2uljv+m+Srb+PAY4DmkAuMgdR8f
         Eisg4DH3xu2sBQ65NlLezBXg4xQgXzAwX+qxk+Z3IGAe5hzuSNWPo1CmQdWrmRhDRIds
         IQ6w7OkGrKpYSWet3+lzhXYYpa987SzRgbiA7wIsv/hWQ19Za+/9jJtwkG3pgIaXxo82
         DlksWnh6pQo0db37G37n2j6gOpEWCEZvJ0JnudJKe6VPvRZKeNOe/bStSSoYFbJeGSh+
         YLMJo7IZF5gRGRxO7bykP1cO0AJpoqYzcfDnh0gP9zhL+czIfUTp8oS4ph0UX9AuUpIw
         TbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691096312; x=1691701112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZFjxlkqEQE8VVVjXcIIbMGH3aHeupBGM7OL/6U2R9w=;
        b=SJAXSn+mDfcIM+LWgdlxunWxZazlFzMSHzZ3HWKNSH7jFKd4njVK4T8NxYoxzsISSB
         4TwjLieEkPMXMBF2q9S3d33g9JT7WOSCAF7CZ9uhJkmUWEE2ZBOPaw93wGnE3dS0rx3c
         bgCn/uYc2RMs+tqfUyRPRLQK2AL38B5yy/Zr6TVv+1nsUPExPxy4dM63FLpZwTnDQpA9
         HJaeBdWAfLybWBXv6lFI2BFh1oxH2+UGUXKgpYkW76yxYCGSFlZ462hEv9d+PtG4EDwp
         cSN3qLXU9PwPRMFQ+x0X1tEIE9hUwxxsWPL5dH2LFj0xVrm1r3gVTEPV1zXWlWlmtkGs
         KaOg==
X-Gm-Message-State: ABy/qLb9CR1IBXQHW1ASE1IbkmNAuC4KpfUOmqVxV4b8M2ReRoV7M6IH
	xrANlCFhyEZYSW31+zVJlAO8ORVMLptPiM8nHepGJA==
X-Google-Smtp-Source: APBJJlEtWLWm5mtRFpaGZ2SIsb7zc28PUzCsEprVBmcbvmc/IZC/nN4lopYafv5ZjKknNev1P4geYhWcSi2JsEJxOfA=
X-Received: by 2002:a0c:e64c:0:b0:635:dda5:bb88 with SMTP id
 c12-20020a0ce64c000000b00635dda5bb88mr19312258qvn.53.1691096312288; Thu, 03
 Aug 2023 13:58:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
 <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org> <CAKwvOdn0ePdAfQBby9zaXi7CA64Foc2NRJfzYyQHaOhz2C9+VA@mail.gmail.com>
 <202308010939.9EC4C98@keescook> <20230801-exhaust-movie-971927@meerkat>
 <CAKwvOdnMf227kX1F_rC+mDdf122ah9o7XcEi2tUHKehaWuo0rA@mail.gmail.com>
 <CAFhGd8pDdJHf8YOb8XztzkPc51KF1F5o30Frx3S4c0OTFNe5Jg@mail.gmail.com>
 <CAKwvOdmmcSdL3=m_0CedFr-DWirZXVgazxQ6kwkeVHQxmyay9A@mail.gmail.com>
 <20230803-sturdily-viscous-f99673@meerkat> <CAKwvOd=5PuW1VWUxmOkXGZtkus2ZoyyW_9HNKnjUwfjGKEr14w@mail.gmail.com>
 <20230803-swifter-chalice-67392c@meerkat>
In-Reply-To: <20230803-swifter-chalice-67392c@meerkat>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Aug 2023 13:58:21 -0700
Message-ID: <CAKwvOd=yzWrw0KrHNyjepdhva0RQHi2nrzoFVLOHTHodkHaMiw@mail.gmail.com>
Subject: Re: [PATCH b4] b4: fix from header not using real name
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Justin Stitt <justinstitt@google.com>, Kees Cook <keescook@chromium.org>, 
	Kees Cook <kees@kernel.org>, "Kernel.org Tools" <tools@linux.kernel.org>, 
	Sterling Stein <scubed@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 3, 2023 at 12:32=E2=80=AFPM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Aug 03, 2023 at 11:41:51AM -0700, Nick Desaulniers wrote:
> > > I am fairly certain that at least some clients will not properly hand=
le such
> > > situations, because I think -f is only supposed to have the email add=
ress, not
> > > the full From-like header.
> > >
> > > Now, the question is -- does sendgmr support the -F flag?
> >
> > It does not currently, but we probably could add support for it.
>
> Per our IRC discussion, I think we stumbled on the solution that works fo=
r
> your case and makes b4 more compatible with git-send-email. Specifically,=
 we
> only pass the -f switch if envelopesender is set.

Yep, thanks for
https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=3D8382882b9fb6c50=
737b6e19198a259850527d2a6
that seems to do it for us.  Please let us know if that gets reverted
and when that ships in a formal release.

We can probably close out
https://bugzilla.kernel.org/show_bug.cgi?id=3D217332 (I was not able to
do so).

>
> > What are your thoughts Konstantin on -t?
>
> I don't really see the point of it, as we already pass the list of recipi=
ents
> as part of the command line invocation. The -t switch is just a convenien=
ce
> flag for humans.

Hmm...given the above fix I guess it's kind of moot.

Thanks again for the fix.  Now I can start formally recommending the
usage of b4 more internally/to my colleagues.

I also look forward to `b4 prep --check` for running checkpatch on my serie=
s!
--=20
Thanks,
~Nick Desaulniers

Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7ED1F16D
	for <tools@linux.kernel.org>; Thu,  3 Aug 2023 17:48:01 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-63cf9eddbc6so11588686d6.0
        for <tools@linux.kernel.org>; Thu, 03 Aug 2023 10:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691084880; x=1691689680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+5vwrjQqGemYsVCTLfWklC6+pxlF0LkqaijWYjco1mo=;
        b=NMuEM4iEypqSGIzW30ThrDO7so5x2eY6gzyB705v57pL75RS9jPFveuNxv/T+33s5a
         alLskbhxCTOazCEosiS8ULgdVjy1G9j4kH9p27zaCfo7PLWvYIItLeYqCcseZasNqO25
         id6VH4WWUqtMimwDsogtRnNJ8b7dCr+gM1brmYQOrSuvQouxl9S7krALzVyioXZg5f76
         zInV8hAxUcorxr4kYT6nLkEbi13xI++c17d/mFSktqwmGhhtCf5RztZbCtcFv8dTJfay
         qjEnfiF5BVoCEvTBPPFZK0HX0e1gU63xtL1TXuEIWLNO/4PXSceL7hnRNad20wyfvKca
         44TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691084880; x=1691689680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+5vwrjQqGemYsVCTLfWklC6+pxlF0LkqaijWYjco1mo=;
        b=fMPqBZe0z5kWW8KJJyi6g5M9pkYkuFlandy7runU32hD3Vi1Btgc+qDeEnGR2KE9g8
         RGc1yZw52549LlZdWirvUoF8lqmVpWtvKDcwKEnsH8HQOnMLf92TdZscQ09iZTJuVqGR
         NNT8iuYC+fLNUCmCReIjcczJ58g+VCOGDwLcxpuYHQkqgss3RXGsNXCe4iZ2KfxpVf5i
         bkOj77sIvwx1yWvISmPiw5HGKMvTVVw+RyEi7Q3twwajuKyGelFVACJZzuDqRhB81dWY
         wm8mE+FKqJSWOiQIXFdWSBZkOIrzzXt/tzxhOXJrR8g7krRtLc8NA9zJwhSU10debijn
         3Cww==
X-Gm-Message-State: ABy/qLYsnl+wWK34DvXYphjYhVDwW8z2FH1LP4PrU0hLRC5F1Kdk9P6U
	Od2KR2WSAj2kjusrXTRSl96oH8xnm2Og54VR6CDkXA==
X-Google-Smtp-Source: APBJJlEpJTmZVYSwd+fqH5kYAqwnoKec/ZA9O/ofeG8xwzACbf7TlSO085GvGsuCftzDkW4fcywcf1p2QxhJIJZ4apI=
X-Received: by 2002:a0c:e10d:0:b0:63d:3934:abf7 with SMTP id
 w13-20020a0ce10d000000b0063d3934abf7mr25757745qvk.21.1691084880136; Thu, 03
 Aug 2023 10:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <20230727-fix-from-header-v1-1-2fb23c0a5da9@google.com>
 <A250134A-7A60-47EB-8849-DB39D08B223B@kernel.org> <CAKwvOdn0ePdAfQBby9zaXi7CA64Foc2NRJfzYyQHaOhz2C9+VA@mail.gmail.com>
 <202308010939.9EC4C98@keescook> <20230801-exhaust-movie-971927@meerkat>
 <CAKwvOdnMf227kX1F_rC+mDdf122ah9o7XcEi2tUHKehaWuo0rA@mail.gmail.com> <CAFhGd8pDdJHf8YOb8XztzkPc51KF1F5o30Frx3S4c0OTFNe5Jg@mail.gmail.com>
In-Reply-To: <CAFhGd8pDdJHf8YOb8XztzkPc51KF1F5o30Frx3S4c0OTFNe5Jg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 3 Aug 2023 10:47:49 -0700
Message-ID: <CAKwvOdmmcSdL3=m_0CedFr-DWirZXVgazxQ6kwkeVHQxmyay9A@mail.gmail.com>
Subject: Re: [PATCH b4] b4: fix from header not using real name
To: Justin Stitt <justinstitt@google.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Kees Cook <keescook@chromium.org>, Kees Cook <kees@kernel.org>, 
	"Kernel.org Tools" <tools@linux.kernel.org>, Sterling Stein <scubed@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 1, 2023 at 3:27=E2=80=AFPM Justin Stitt <justinstitt@google.com=
> wrote:
>
> On Tue, Aug 1, 2023 at 3:25=E2=80=AFPM Nick Desaulniers <ndesaulniers@goo=
gle.com> wrote:
> >
> > On Tue, Aug 1, 2023 at 10:05=E2=80=AFAM Konstantin Ryabitsev
> > <konstantin@linuxfoundation.org> wrote:
> > >
> > > On Tue, Aug 01, 2023 at 09:44:54AM -0700, Kees Cook wrote:
> > > > I don't, no. I also don't use "b4 send" (just "git send-email"), so=
 it's
> > > > not clear to me what's actually going wrong here. It still looks to=
 me
> > > > like either "b4 send" isn't writing a "From:" header, or Justin (an=
d
> > > > your?) MUA is removing/replacing it when it processes the "-f" argu=
ment.
> > >
> > > I'm pretty sure this is the side-effect of using sendgmr, which force=
s the
> > > in-header From: to match what was passed in the -f parameter. It's ju=
st
> > > another way in which it differs from /bin/sendmail.
> >
> > Going back and forth between the maintainer of sendgmr here...
> >
> > I don't think you ever responded to my question of `-t`:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D217332#c9
> FWIW, I tried manually adding `-t` from inside of b4 and it did _not_
> fix the issue. sendgmr still botched the From: header.

Hmm...that was not my experience.  Using the patch to b4 that you sent me:
```
 b4/__init__.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/b4/__init__.py b/b4/__init__.py
index b974642..993d6f6 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -3259,7 +3259,7 @@ def get_smtp(dryrun: bool =3D False) ->
Tuple[Union[smtplib.SMTP, smtplib.SMTP_SSL
         else:
             envpair =3D email.utils.parseaddr(fromaddr)
         if envpair[1]:
-            smtp +=3D ['-f', envpair[1]]
+            smtp +=3D ['-t']
         return smtp, fromaddr

     encryption =3D sconfig.get('smtpencryption')
```

Here was the recent result:
https://lore.kernel.org/llvm/20230803-ppc_tlbilxlpid-v2-1-211ffa1df194@goog=
le.com/
(Note to followers, the very first line has:

From: Nick Desaulniers <ndesaulniers@google.com>

compare that with v1:
https://lore.kernel.org/all/20230803-ppc_tlbilxlpid-v1-1-84a1bc5cf963@googl=
e.com/

From: ndesaulniers@google.com

This is a PITA because now patches are getting merged without my name on th=
em.
example: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/commit/?id=3D79e8328e5acbe691bbde029a52c89d70dcbc22f3

author ndesaulniers@google.com <ndesaulniers@google.com>

Konstantine, can you please help?

In particular, I would love if you could address the question about
using `-t` rather than `-f <email addr>`, or provide concrete feedback
to Sterling (cc'ed) on what the expected behavior of the external
mailer is, such that Sterling can then provide feedback on whether
that's acceptable or not.



--
Thanks,
~Nick Desaulniers

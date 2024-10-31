Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497601A08A4
	for <tools@linux.kernel.org>; Thu, 31 Oct 2024 14:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730383633; cv=none; b=O1yryadbOMl1vGINqnCZNXu7EORlwXS0v5JqerUgzsYstKdl4EsD06DNkkHeqtWvsC8uUf/IrDneaaVGb7Gh6ohUGgi9JAe7yyA1A8CZ2O0JilsiwvCOtgdd8USZdKR+bZYPMuTIQ9mEw+VdxXi2ZpPUINNCp5wH7BbfOL6b+Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730383633; c=relaxed/simple;
	bh=evxeY27aB2zVbvRjZmwperkMln2qNLSnXM+pJjcqjGU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=CzItjZxCBbx+OvIMPprckxlFIecbVOwfc16fs2KBsr8N6EkDKPV+7LrJ3QzaWvAgI6pqux09Tul3LADsn1hRRd3+vKCQFgYBNK4Po27rPpViloIcXvbbP95pg3Pm/S2wf2rZ/fasJE9SyfhHDs4ieD7Y75cZjwS0tNKx3nkO2Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AVZK1ga6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AVZK1ga6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c693b68f5so10384805ad.1
        for <tools@linux.kernel.org>; Thu, 31 Oct 2024 07:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730383630; x=1730988430; darn=linux.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J8+XcrB1vMTR28xhlELyIAKaXEaWffRSHHtUFugeiHA=;
        b=AVZK1ga61BlRfhOFyEJzKbOdK/WGWkXawlBYX8opUtxHyxIk4uLi3e7hOC2EVJOPh5
         IPGawDXz00nsxTjNZi4ypTg/Zlrblc6BwqJ8SKt+o9L/aHbCblQmNf3HtjR4vKWeANcG
         hJWOXWelj0zw39WrG2JoAUQZ8R//OrJFsWniTm6cNTEBduG9BrciSfZ6WyMJazSsJUnT
         Z8E4Zjacnx7txTz1sr9VXLAinFFS8U30Ir5UdX8qtiC6bxTyNJWbujDT1YOoxZ7qKpGr
         2i6PItNulNX5m3rlPS5sZxz9lA18qGyDsyTWafdkbzkFD+duuPQvdd7WM3YdAUUntSdr
         YfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730383630; x=1730988430;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J8+XcrB1vMTR28xhlELyIAKaXEaWffRSHHtUFugeiHA=;
        b=MtQrmYdCb4PXA3NINesZWEi12j3Cbf9B0WI1DoBXx0nfKse/h3AAQKnzA5L01xUq3b
         OTVCKYsvKDfXNSesGDmDmzipwJ18OXM2Tx7TgoMNxSbT3aKpkBo4+u5eRUggKgc3Cbtt
         qunwdiUYfFRTpcHaF+zxVytkD9mdUg9IDSiGRSlqo5uXXd74SONWr+l+nDXhN2IEjsI2
         e/Y5otx/HdDWleAM9NidrfAeiVPfqXmxXCM9ARPdAFGBFJ1unJiAxo8DLLOjgJKZYdb3
         XTNqCPxv1U4nopDRT3ElWxeVv/KUxRnPl5PCAoR0xwcFB8H/OmnFzAi5HWqzfJ93HZd+
         U6Kg==
X-Gm-Message-State: AOJu0YziGm/6OQyLvV4dvEvJi876L5SvIbEiXxBZNnrswvZ0i4xGhxHx
	tm4Ya30O18LWZJvOld7Ng+S8k1EUyXNYfjxWwoxZOK7GsMR2LH4M2Y8z5TgrsJW7h/ItrfnTwFt
	ykn1bQAaeLjt8rzfAk2lRGdjoIYiCKRa/gTk9EjZyT3D10atSyl/6
X-Google-Smtp-Source: AGHT+IG/rxeU1QX+2YbnvN3dz81NbBI+YtQU471fmv6Ry/9IxTqU8Cam9gNifcbc+oUX8QkyBOXfrD4Hb68MSIjr2bk=
X-Received: by 2002:a17:902:da82:b0:20b:7ec0:ee21 with SMTP id
 d9443c01a7336-21103ace09bmr38292515ad.19.1730383629769; Thu, 31 Oct 2024
 07:07:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Ricardo Ribalda <ribalda@google.com>
Date: Thu, 31 Oct 2024 15:06:56 +0100
Message-ID: <CANiDSCvSAVkSsdWzfGFHK2YZXy_dOHVeJOA7V0pmyzHzSm6iEw@mail.gmail.com>
Subject: Bug in b4 shazam?
To: tools@linux.kernel.org
Cc: Hans Verkuil <hverkuil@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin

Our CI bot has encounter some issues with this series:
93d078e5-deba-4060-a32e-94bce677453c@xs4all.nl

it complains that the patch is corrupted:
error: corrupt patch at line 27

But it looks like b4 generated the corruption.



b4 mbox 93d078e5-deba-4060-a32e-94bce677453c@xs4all.nl' gives a valid
patch as well.

But 'b4 shazam' messes up the patch: it deletes the empty line before
the '--' at the
end of the patch:

I.e., after running b4 shazam I run: 'git am
--show-current-patch=diff' to see what the
patch is it tries to apply, and that gives me:

 .. _v4l2-alpha-component:
--
2.45.2

instead of:

 .. _v4l2-alpha-component:

--
2.45.2

Is this a known bug?

PS: kudos to Hans to debug the root cause

-- 
Ricardo Ribalda
Software Engineer
ribalda@google.com

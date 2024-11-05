Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D4E21503B
	for <tools@linux.kernel.org>; Tue,  5 Nov 2024 22:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730844890; cv=none; b=rec4Ses6yQRRma9LFQSF5blYxxarThAyHZJ8L2T2b6rtDaUf0kzi8J7laOnPouXl9KKdVashlC6nRxpZPb7mY+0P1PfSVa856wiPiE6jUfHCkBb9tdYckyMDfCOkp/XKv3PqvMCpYeSJR4KYqb2PlpmzwLE699NUpFIFNu5V+a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730844890; c=relaxed/simple;
	bh=WYSEimgDkKseV4FrDU7ykxaEjnjyJscJgtSy9xrkja8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Rc33IPJtuFUR+5OqK/KO2yk7PRz82PqIPTg++w/B89Vrso7T5aOz69aYPd2LfmgwbSZyiCGFsmQtiyOg1JAh9Cnk8+rm9dofGWUNg1BHGb1KPJqnnmmVQZJWGEa0H+wk6TVmKPYDEi8BrFDRxEM3gfxkFRxujXSFlMvsKYjjX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qDmtoCaA; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qDmtoCaA"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2e2fb304e7dso4774075a91.1
        for <tools@linux.kernel.org>; Tue, 05 Nov 2024 14:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730844887; x=1731449687; darn=linux.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YVxsSsyOFTKG8mlb0ILWHQeBypJg1Q0ri+Bjg4a65jQ=;
        b=qDmtoCaA9FD6jRVsupPZBdnyT1sWqnyoTYBbitk++yRVjKRAgUtmuDmIgHkAm2Jsr1
         4BwHYvCuubzdgnd1+IuxyIhadaSbzQh1RF6dnBg95tO3RHwuGr2PSYn2AeAmIjkNDsmv
         /pnjvhl4z/4XshaUm9f6FCmXunNzx4eIGkPfeaBnk6zEvTIMTuWp2m+JvFIP/xDZy49H
         BNFOZrrjOrxjceGBsFoodYa7bGU8NYtMqGl/WRNYkmpLVUtToAQu98pc2dOykOFJfaH9
         2iFdUMbwZA1Eeedpe27XR7y3c+biPbclKPa0J7o2QZl0ylBtgWDVqJFd+wt1COCd9sw6
         JoSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730844887; x=1731449687;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YVxsSsyOFTKG8mlb0ILWHQeBypJg1Q0ri+Bjg4a65jQ=;
        b=fHAqlBtzDtEpsAAXnWSwUTI8KtP/yIVsywZR2TCL26tg5MXlyNuH7VQToihiB3kG2Y
         uJgAmdc+TqaqRFD7WoHqQ44zFas8k9VDoTTt12vGOM3XnOnmVV7N9fFGa1/TnO5RfouY
         lnfZBPdANGd0Q3+HWxYKq1u6BfnqaG4l6Y7n9o7mC7uIaeUUN4bmOSYydX+u/o21Xplo
         UACtm9FSmjLLkZf7qiPVpQqJzY8P03qjyqPz4Eryq4SHniNwmR/kOc3l2SkhhjyxV+Gp
         aUL8t0jzPG4/gZy0YXbTovCnCZF8ET6cGvce0LK/7Vy9badXfedw98ma71J7YmB+G85r
         uuvw==
X-Gm-Message-State: AOJu0YwMKxiLr5rtoy5HmxrrIn5lYCSBJ9Ozzyy60nsGjku0QPj5GwWa
	YW6pvnTS+PZKkl6Tew7z6clnoUxsyR3QyLxc2C1vuhX0XwzqGuac1DiKZB7mvB+fmQ40A57oHPK
	gYIbtAqdwoPFJ2WolbSpdMURIqFY3KZd05bHZZQAGdFHHRaAyHcS4
X-Google-Smtp-Source: AGHT+IFGgydFLsw3+Vj/o+wYYMxAVG2Y0CZsi5MD0odKL84QY8DiudgTEj61Y13AKPA4R0/Cx4/mMA2L8NRSdgUJztU=
X-Received: by 2002:a17:90a:d14f:b0:2e2:bb32:73eb with SMTP id
 98e67ed59e1d1-2e8f10a72a3mr41897207a91.31.1730844887096; Tue, 05 Nov 2024
 14:14:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Ricardo Ribalda <ribalda@google.com>
Date: Tue, 5 Nov 2024 23:14:34 +0100
Message-ID: <CANiDSCthqbGqv88O-cyPA4rioMuXU6jOZZvkUcaGGw5KH6KOaQ@mail.gmail.com>
Subject: Bug? in b4 shazam when reading from local mailbox
To: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konstantin

I think our CI bot has found another issue.

I get this error when I try to do shazam from a mbox that I have
previously downloaded.
It does not happen for every series.

ribalda@denia:~/work/linux$ ../b4/b4.sh mbox
20241105-uvc-crashrmmod-v3-1-c0959c8906d3@chromium.org -n test.mbx ;
../b4/b4.sh shazam -m test.mbx
Grabbing thread from
lore.kernel.org/all/20241105-uvc-crashrmmod-v3-1-c0959c8906d3%40chromium.org/t.mbox.gz
1 messages in the thread
Saved ./test.mbx
Checking for newer revisions
Grabbing search results from lore.kernel.org
Traceback (most recent call last):
  File "/usr/local/google/home/ribalda/work/b4/b4/command.py", line
373, in <module>
    cmd()
  File "/usr/local/google/home/ribalda/work/b4/b4/command.py", line 356, in cmd
    cmdargs.func(cmdargs)
  File "/usr/local/google/home/ribalda/work/b4/b4/command.py", line
96, in cmd_shazam
    b4.mbox.main(cmdargs)
  File "/usr/local/google/home/ribalda/work/b4/b4/mbox.py", line 670, in main
    msgs = get_extra_series(msgs, direction=1, nocache=cmdargs.nocache)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/google/home/ribalda/work/b4/b4/mbox.py", line 632,
in get_extra_series
    msgs.append(q_msg)
    ^^^^^^^^^^^
AttributeError: 'mbox' object has no attribute 'append'

If I add the command --offline-mode to shazam, it works as expected

Regards!

-- 
Ricardo Ribalda
Software Engineer
ribalda@google.com
